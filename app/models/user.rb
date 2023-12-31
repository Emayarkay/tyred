class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[strava]

  has_many :bikes, dependent: :destroy
  has_many :bike_components, through: :bikes

  validates :first_name, :last_name, presence: true

  has_one_attached :profile_image

  def self.from_omniauth(auth, current_user_email)
    user = User.find_by(email: current_user_email)
    # user = find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   # user.name = auth.info.name   # assuming the user model has a name
    #   # user.image = auth.info.image # assuming the user model has an image
    #   # If you are using confirmable and the provider(s) you use validate emails,
    #   # uncomment the line below to skip the confirmation emails.
    #   # user.skip_confirmation!
    # end
    user.update(
      email: auth.info.email || current_user_email,
      first_name: auth.info.first_name || user.first_name,
      last_name: auth.info.last_name || user.last_name,
      uid: auth.uid,
      provider: auth.provider,
      access_token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token
    )

    user.sync_bike_components_with_strava

    user
  end

  def sync_bike_components_with_strava
    bike_components.each do |bike_component|
      SyncStravaJob.perform_later(bike_component)
    end
  end

  def strava_connected?
    uid.present?
  end

  def strava_service
    @strava_service = StravaService.new(user_id: id)
  end
end
 # current_user.strava_connected?

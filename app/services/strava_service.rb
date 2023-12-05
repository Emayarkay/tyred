class StravaService < ApplicationService
  attr_reader :user, :access_token

  def initialize(user_id:)
    @user = User.find(user_id)
    @access_token = @user.access_token
  end

  def client
    Strava::Api::Client.new(access_token: access_token)
  end

  def calculate_total_distance(since_date:)
    page = 1
    sum = 0
    activities = []
    collection = client.athlete_activities(after: since_date.to_time.to_i, per_page: 30, page: page).collection
    activities << collection

    while collection.any?
      page += 1
      collection = client.athlete_activities(after: since_date.to_time.to_i, per_page: 30, page: page).collection
      activities << collection
    end
    activities.flatten.sum do |activity|
      activity["distance"]
    end.fdiv(1_000)
  end
end

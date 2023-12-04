class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  def strava
    @user = User.from_omniauth(request.env["omniauth.auth"], current_user.email)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Strava") if is_navigational_format?
    else
      session["devise.strava_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_path, alert: "Please fill in the missing information"
    end
  end

  def failure
    redirect_to new_user_session_path, alert: "Something went wrong with your login"
  end
end

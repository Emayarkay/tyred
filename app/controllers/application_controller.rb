class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :disable_navbar
  before_action :authenticate_user!

  def disable_navbar
    @disable_navbar = devise_controller?
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :uid, :provider, :access_token, :refresh_token])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profile_image])
  end

  helper_method :strava_connected?

  private

  def strava_connected?
    !!current_user&.strava_connected?
  end
end

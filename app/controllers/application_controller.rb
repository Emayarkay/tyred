class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
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

  def storable_location?
    request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr? &&
      !turbo_frame_request?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope)
  end
end

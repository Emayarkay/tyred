class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :disable_footer, if: :devise_controller?

  def home
    if current_user
      redirect_to bikes_path
    else
      redirect_to new_user_session_path
    end
  end

  def disable_footer
    @disable_footer = true
  end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end

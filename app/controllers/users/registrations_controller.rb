# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      if strava_data = session["devise.strava_data"]
        resource.first_name = strava_data.dig('info', 'first_name')
        resource.last_name = strava_data.dig('info', 'last_name')
        resource.uid = strava_data.dig('uid')
        resource.provider = strava_data.dig('provider')
        resource.access_token = strava_data.dig('credentials', 'token')
        resource.refresh_token = strava_data.dig('credentials', 'refresh_token')
      end
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end

Rails.application.config.after_initialize do
  STRAVA_CLIENT = Strava::Api::Client.new(access_token: ENV['STRAVA_API'])
end

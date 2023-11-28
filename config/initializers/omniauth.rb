Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, ENV[’STRAVA_CLIENT_ID]
end

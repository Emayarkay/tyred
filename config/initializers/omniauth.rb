Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, ENV['CLIENT_ID'], ENV['YOUR_CLIENT_SECRET'], scope: 'read_all'
end

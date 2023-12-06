OmniAuth::Strategies::Strava.class_eval do
  def token_params
    super.tap do |params|
      params[:client_id] = options[:client_id]
      params[:client_secret] = options[:client_secret]
    end
  end
end
Strava::Api::Client.class_eval do
  def initialize(options = {})
    Strava::Api::Config::ATTRIBUTES.each do |key|
      send("#{key}=", options[key] || Strava::Api.config.send(key))
    end
    super
    @ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'
    @ca_path = '/usr/lib/ssl/certs'
  end
end
OmniAuth::Strategies::Strava.class_eval do
  def token_params
    super.tap do |params|
      params[:client_id] = options[:client_id]
      params[:client_secret] = options[:client_secret]
    end
  end
end

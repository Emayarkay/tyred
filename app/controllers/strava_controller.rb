#require 'json'
#require 'open-uri'
#class StravaController < ApplicationController
 # include HTTParty
  #base_uri "www.strava.com"
  #def fetch_distances
   # api_key = session[:access_token]

   # activities = fetch_activities_from_strava(api_key)

    # if activities.present?
     # @distances = fetch_distances_from_activities(api_key, activities)
     # render json: @distances
    # else
     # render json: { error: 'No activities found' }, status: :not_found
    # end
  #end

  # def fetch_auth_token
    # response = HTTParty.post('https://www.strava.com/api/v3/oauth/token', {
    #   body: {
    #     client_id: ENV["CLIENT_ID"], # ENV["CLIENT_ID"]
    #     client_secret: ENV["CLIENT_SECRET"],
    #     code: params[:code],
    #     grant_type: 'authorization_code'
    #   }
    # })
   # redirect_to "http://www.strava.com/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}&response_type=code&redirect_uri=#{strava_setup_url}&scope=read", allow_other_host: true
  # end


  #def setup
    # Retrieve user inputs from the form
   # api_key = params[:api_key]
    #client_id = params[:client_id]
    #client_secret = params[:client_secret]

    # Save the user inputs for future use (e.g., in a database associated with the user)
    # For simplicity, you can store it in the session in this example
    #session[:api_key] = api_key
    #session[:client_id] = client_id
    #session[:client_secret] = client_secret
    raise
    # Redirect to a page where you can trigger the fetching of distances or handle it accordingly
    #redirect_to fetch_auth_token_path
  #end


  #private

  #def fetch_activities_from_strava(api_key)
    #client = Strava::Api::Client.new(access_token: session[:access_token])
    #client.athlete_activities
  #end

  #def fetch_distances_from_activities(api_key, activities)
   # client = Strava::Api::Client.new(access_token: api_key)
    #distances = []

    #activities.each do |activity|
     # activity_details = client.retrieve_an_activity(activity['id'])
     # distance = activity_details['distance']
     # distances << { activity_id: activity['id'], distance: distance }
    #end

   # distances
 # end
#end

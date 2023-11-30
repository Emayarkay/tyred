require 'json'
require 'open-uri'
class StravaController < ApplicationController
  include HTTParty
  base_uri "www.strava.com"
  def fetch_distances
    api_key = session[:access_token]

    activities = fetch_activities_from_strava(api_key)

     if activities.present?
      @distances = fetch_distances_from_activities(api_key, activities)
      render json: @distances
     else
      render json: { error: 'No activities found' }, status: :not_found
     end
  end

  private

  def fetch_activities_from_strava(api_key)
    client = Strava::Api::Client.new(access_token: session[:access_token])
    client.athlete_activities
  end

  def fetch_distances_from_activities(api_key, activities)
    client = Strava::Api::Client.new(access_token: api_key)
    distances = []

    activities.each do |activity|
      activity_details = client.retrieve_an_activity(activity['id'])
      distance = activity_details['distance']
      distances << { activity_id: activity['id'], distance: distance }
    end

    distances
  end
end

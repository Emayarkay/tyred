class StravaService
  def fetch_strava_data(access_token)
    client = Strava::Api::Client.new(access_token: access_token)

    # Fetch a specific activity by its ID
    activity_id = ''
    activity = client.retrieve_an_activity(activity_id)

    if activity
      distance = activity['distance'] # Distance in meters
      distance_in_km = distance / 1000.0 # Convert meters to kilometers
      distance_in_miles = distance * 0.000621371 # Convert meters to miles

      puts "Distance: #{distance_in_km} km or #{distance_in_miles} miles"
    else
      puts 'Activity not found'
    end
  end
end

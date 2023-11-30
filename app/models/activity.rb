class Activity
  def self.fetch_and_process_activity(activity_id)
    activity = STRAVA_CLIENT.activity(activity_id)
    if activity
      p activity
      distance = activity['distance']
      distance_in_km = distance / 1000.0
      distance_in_miles = distance * 0.000621371
      puts "Distance: #{distance_in_km} km or #{distance_in_miles} miles"
    else
      puts 'Activity not found'
    end
  end
  def self.createActivityTest
    activity = STRAVA_CLIENT.create_activity(
      name: 'Afternoon Run',
      sport_type: 'Run',
      start_date_local: Time.now,
      elapsed_time: 1234, # in seconds
      description: 'Test run.',
      distance: 1000 # in meters
    )
    p activity
  end
end

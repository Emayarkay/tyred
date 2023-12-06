class SyncStravaJob < ApplicationJob
  queue_as :default

  def perform(bike_component)
    bike_component.set_distance_travelled
  end
end

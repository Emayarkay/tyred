class ActivitiesController < ApplicationController
  def show
    @activity_id = params[:id] # gets the ID from the URL
    Activity.fetch_and_process_activity(@activity_id)
  end
end

class BikesController < ApplicationController
  before_action :set_bike, only: %i[edit update destroy]

  def index
    @bikes = current_user.bikes
    current_user.bikes.each do |bike|
      bike.bike_components.each do |bike_component|
        @days_left = (bike_component.component.time_until_check * 7) - ((Date.today + 64) - bike_component.date_added).to_f
        @weeks_left = bike_component.component.time_until_check - (((Date.today + 64) - bike_component.date_added) / 7).to_i
        @distance_left = bike_component.component.distance_until_check 
        @time_progress_percentage = (@days_left / (bike_component.component.time_until_check * 7)) * 100
      end
    end
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save!
      redirect_to bikes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to bikes_path
  end

  def destroy
    @bike.destroy!
    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:make, :model)
  end
end

class BikesController < ApplicationController
  before_action :set_bike, only: %i[edit update destroy]


def index
  # Fetch all bikes for the current user
  @bikes = current_user.bikes

  # Check if there's at least one bike
  if @bikes.present?
    # Set @bike to the first bike (or any logic you prefer)
    @bike = @bikes.first
  else
    # Handle the scenario where no bikes are present
    @bike = nil # or any other appropriate handling
  end
end

  def new
    @bike = Bike.new
    @component = Component.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
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

  def reset_meter
    @bike = Bike.find(params[:id])
    @bike.bike_components.each do |bike_component|
      component = bike_component.component
      component.update(time_until_check: 0, distance_until_check: 0)
    end
    flash[:notice] = 'Meter reset successfully.'

  end



  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:make, :model, :photo)
  end
end

class BikesController < ApplicationController
  def index
    @bikes = current_user.bikes
  end

  def new
    # Linking rails link helper at bottom of page to show page for user's first bike - may need to change if my garage concept changes
    @user_first_bike = current_user.bikes.first
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
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to bikes_path
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy!
    redirect_to bikes_path
  end

  private

  def bike_params
    params.require(:bike).permit(:make, :model)
  end
end

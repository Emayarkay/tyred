class BikeComponentsController < ApplicationController

  def new
    @bikecomponent = BikeComponent.new
    @components = Component.all
    @component = Component.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @bikecomponent = BikeComponent.new(bike_component_params, date_added: DateTime.now, distance_travelled: 0)
    @bike = Bike.find(params[:bike_id])
    @bikecomponent.bike = @bike
    if @bikecomponent.save!
      redirect_to bikes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bikecomponent = BikeComponent.find(params[:id])
  end

  def update
    @bikecomponent = BikeComponent.find(params[:id])
    @bikecomponent.update(bike_component_params)
    redirect_to user_path(@bikecomponent.current_user)
  end

  def destroy
    @bikecomponent = BikeComponent.find(params[:id])
    @bikecomponent.destroy
    redirect_to bike_path
  end

  private

  def bike_component_params
    params.require(:bike_components).permit(:component_id)
  end


end

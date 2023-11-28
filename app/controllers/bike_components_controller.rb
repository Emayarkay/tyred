class BikeComponentsController < ApplicationController

  def new
    @bikecomponent = BikeComponent.new
  end

  def create
    @bikecomponent = BikeComponent.new(bike_component_params)
    if @bikecomponent.save
      redirect_to bike_path(@bikecomponent.current_user)
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
    params.require(:bike_components).permit(:date_added)
  end


end

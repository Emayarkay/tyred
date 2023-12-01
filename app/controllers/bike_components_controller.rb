class BikeComponentsController < ApplicationController

  def show
    @bike = Bike.find(params[:bike_id])
    @bike_component = BikeComponent.find(params[:id])
  end

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
    @bike = Bike.find(params[:bike_id])
    @bike_component = BikeComponent.find(params[:id])
  end

  def update
    @bikecomponent = BikeComponent.find(params[:id])
    @bikecomponent.update(bike_component_params)
    respond_to do |format|
      format.html { redirect_to user_path(@bikecomponent.user) }
      format.text
    end
  end

  def destroy
    @bikecomponent = BikeComponent.find(params[:id])
    @bikecomponent.destroy
    redirect_to bike_path
  end

  private

  def bike_component_params
    params.require(:bike_component).permit(:component_id, :date_added)
  end


end

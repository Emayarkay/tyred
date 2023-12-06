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
    @bike = Bike.find(params[:bike_id])
    @component = Component.find(params[:component_id])

    @bike_component = BikeComponent.new(bike: @bike, component: @component, date_added: DateTime.now, distance_travelled: 0)

    if @bike_component.save
      redirect_to bikes_path, notice: 'BikeComponent was successfully created.'
    else
      @components = Component.all # Assuming you want to re-render the form with components if the save fails
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

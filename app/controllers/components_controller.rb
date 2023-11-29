class ComponentsController < ApplicationController

  def create
    @component = Component.new(component_params)
    @bike = Bike.find(params[:bike_id])
    if @component.save!
      @bike_component = BikeComponent.new(bike: @bike, component: @component, date_added: DateTime.now, distance_travelled: 0)
      @bike_component.save!
      redirect_to bikes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def component_params
    params.require(:component).permit(:name, :time_until_check, :distance_until_check, :check_advice)
  end
end

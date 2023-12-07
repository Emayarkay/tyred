class ComponentsController < ApplicationController

  def show
    @component = Component.find(params[:id])
    p @component.attributes
    render json: { component: @component.attributes }
  end

  def create
    @components = Component.all
    @component = Component.new(component_params)
    @bike = Bike.find(params[:bike_id])
    if @component.name.downcase == 'chain'
      @component.check_img.attach(io: File.open('app/assets/images/check_chain.jpg'), filename: "check_chain.jpg", content_type: "image/jpg")
      @component.icon.attach(io: File.open('app/assets/images/bike_chain.png'), filename: "bike_chain.png", content_type: "image/png")
    elsif @component.name.downcase.include?('tyre')
      @component.check_img.attach(io: File.open('app/assets/images/pinch_test.jpeg'), filename: "pinch_test.jpeg", content_type: "image/jpeg")
      @component.icon.attach(io: File.open('app/assets/images/bike_tyre.png'), filename: "bike_tyre.png", content_type: "image/png")
    elsif @component.name.downcase == 'brake pads'
      @component.check_img.attach(io: File.open('app/assets/images/check_brake_pads.jpg'), filename: "check_brake_pads.jpg", content_type: "image/jpg")
      @component.icon.attach(io: File.open('app/assets/images/brake_pad.png'), filename: "brake_pad.png", content_type: "image/png")
    end
    if @component.save
      @component.custom = true if @component.id > 4
      if @component.save
        @bike_component = BikeComponent.new(bike: @bike, component: @component, date_added: DateTime.now, distance_travelled: 0)
        @bike_component.save!
        redirect_to bikes_path
      else
        render 'bike_components/new', status: :unprocessable_entity
      end
    else
      render 'bike_components/new', status: :unprocessable_entity
    end
  end

  private

  def component_params
    params.require(:component).permit(:name, :time_until_check, :distance_until_check, :check_advice)
  end
end

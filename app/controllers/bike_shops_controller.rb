class BikeShopsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @distance_to_location = {}

    if params[:search].present? && params[:search][:location].present?
      @location = Geocoder.search(request.ip)&.first&.coordinates
      if @location
        @bike_shops = BikeShop.near(@location, 10) # Search within 10 miles, adjust as needed
        @distance_to_location = {} # Store distances for each shop

        @bike_shops.each do |shop|
          distance = Geocoder::Calculations.distance_between(@location, [shop.latitude, shop.longitude])
          @distance_to_location[shop.id] = distance.round(2) # Store the distance for each shop
        end
      else
        flash[:alert] = "Invalid location. Please enter a valid address."
        redirect_to bike_shops_path
      end
    else
      @bike_shops = BikeShop.all
    end

    if params[:query].present?
      @bike_shops = @bike_shops.where("location ILIKE ?", "%#{params[:query]}%")
    end

    @markers = @bike_shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end

    respond_to do |format|
      format.html
      format.json do
        render(
          json: {
            html: render_to_string(partial: "bike_shops/list", locals: { bike_shops: @bike_shops }, formats: [:html]),
            markers: @markers
          }
        )
      end
    end
  end



end

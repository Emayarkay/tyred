class BikeShopsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bike_shops = BikeShop.all

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

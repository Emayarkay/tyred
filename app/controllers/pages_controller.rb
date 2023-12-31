class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    respond_to do |format|
      format.json
    end
  end

  def show
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

  end

  def home
  end

end

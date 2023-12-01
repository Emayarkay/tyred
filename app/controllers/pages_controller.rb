class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @bike_shops = BikeShop.all

    @markers = @bike_shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end

    if params[:query].present?
      @bike_shops = @bike_shops.where(location: params[:query])
    end
  end

  def home
  end

end

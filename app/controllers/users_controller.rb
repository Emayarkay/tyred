class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @strava_connected = @user.present? && @user.strava_connected?
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def sync_strava
    current_user.sync_bike_components_with_strava
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_image)
  end
end

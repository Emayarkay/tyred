class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @strava_connected = @user.present? && @user.strava_connected?
  end

  def edit
    @user = current_user
  end

  def strava_connected
    user = current_user
    if user.present? && user.strava_connected?
      render json: { strava_connected: true }
    else
      render json: { strava_connected: false }
    end
  end

  def update
    @user = User.find(params[:id])
    p params[:user][:profile_image] if params[:user]
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_image)
  end
end

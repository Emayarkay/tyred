class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
  end

  def home
  end

end

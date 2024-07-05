class Thirdspace::LandingController < ApplicationController
  def index
    @users = User.all
  end
end
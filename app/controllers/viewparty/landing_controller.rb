class Viewparty::LandingController < ApplicationController
  def index
    @viewers = Viewer.all
  end
end
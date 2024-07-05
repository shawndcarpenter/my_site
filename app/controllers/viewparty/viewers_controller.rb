class Viewparty::ViewersController < ApplicationController
  def index
    @viewers = Viewer.all
  end

  def new
  end

  def create
    new_viewer = Viewer.new(viewer_params)
    if new_viewer.save
      redirect_to viewparty_viewer_path(new_viewer)
      flash.notice = "Viewer Has Been Created."
    else
      redirect_to viewparty_register_path
      flash[:alert] = "Error: #{error_message(new_viewer.errors)}"
    end
  end

  def show
    @viewer = Viewer.find(params[:id])
    @viewer_parties = @viewer.viewer_parties
  end

  private
    def viewer_params
      params.permit(:name, :email, :password)
    end
end
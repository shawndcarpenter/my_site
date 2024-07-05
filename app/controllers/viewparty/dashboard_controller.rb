class Viewparty::DashboardController < ApplicationController
  def show
    @primary = Viewer.find(params[:viewer_id])
    # viewer who is viewing the viewer's dashobard
    @viewed = Viewer.find(params[:id])
    # viewer whose dashboard is being viewed
    @viewer_parties = @viewed.viewer_parties
  end
end
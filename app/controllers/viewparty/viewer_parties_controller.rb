class Viewparty::ViewerPartiesController < ApplicationController
  before_action :find_viewer, only: [:new, :index]

  def index
    @parties = @viewer.viewer_parties
  end

  def new
    @movie_facade = DetailedMovieFacade.new(params[:movie_id])
  end

  def create
    viewer = Viewer.find(params[:viewer_id])
    movie = DetailedMovieFacade.new(params[:movie_id]).detailed_movie

    if params[:duration].to_i < movie.runtime
      redirect_to viewparty_new_viewer_movie_viewing_party_path(viewer, movie.id)
      flash.notice = "Error! Viewing party duration cannot be less than the movie runtime, please fill this out correctly."
      return
    end

    party = Party.create!(viewer_parties_params)
    party.update!(movie_title: movie.title, movie_id: movie.id)

    if params[:invitees]
      params[:invitees].each do |id|
        ViewerParty.create!(viewer_id: id.to_i, party_id: party.id, host: false, host_id: viewer.id)
      end
    end

    ViewerParty.create!(viewer_id: params[:viewer_id], party_id: party.id, host: true, host_id: params[:viewer_id])
    redirect_to viewparty_viewer_path(viewer)
  end

  private 
  
  def viewer_parties_params
    params.permit(:duration, :day, :start_time)
  end

  def find_viewer
    @viewer = Viewer.find(params[:viewer_id])
  end
end
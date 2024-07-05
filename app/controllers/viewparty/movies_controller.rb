class Viewparty::MoviesController < ApplicationController
  before_action :find_viewer
  def index
    if params[:query] == ""
      redirect_to viewparty_viewer_discover_index_path(@viewer)
      flash.notice = "No Search Terms Provided."
    elsif params[:query].present?
      @facade = MovieSearchFacade.new(params[:query])
    else
      @facade =PopularMoviesFacade.new
    end
  end

  def show
    @movie_facade = DetailedMovieFacade.new(params[:id])
    @cast_facade = MovieCastFacade.new(params[:id])
    if @movie_facade.detailed_movie.poster_path.nil?
      @movie_poster_facade = MoviePosterFacade.new(1132679)
    else
      @movie_poster_facade = MoviePosterFacade.new(params[:id])
    end
    @reviews_facade = MovieReviewsFacade.new(params[:id])
  end

  private

  def find_viewer
    @viewer = Viewer.find(params[:viewer_id])
  end
end
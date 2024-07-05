class ViewerParty < ApplicationRecord
  belongs_to :viewer
  belongs_to :party

  def host
    Viewer.find(host_id)
  end

  def movie_poster_file_path
    @movie_facade = DetailedMovieFacade.new(self.party.movie_id)
    if @movie_facade.detailed_movie.poster_path.nil?
      @movie_poster_facade = MoviePosterFacade.new(1132679)
    else
      @movie_poster_facade = MoviePosterFacade.new(self.party.movie_id)
    end
    @movie_poster_facade.movie_poster.file_path
  end

  def invited_viewers
    party.viewers.where.not(id: viewer.id)
  end
end
class MoviesController < ApplicationController
  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to movies_path
  	else 
  		render 'new'
  	end
  end

  def movie_params
  	params.require(:movie).permit(:title, :release_date, :event_id)
  end

  def index
  	@movies = Movie.all
  end
end

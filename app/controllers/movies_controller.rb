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

  def show
    @movie = Movie.find(params[:id])
    @movieEvent = Event.find(@movie.event_id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie.id)
    else 
      render 'edit'
    end
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

end
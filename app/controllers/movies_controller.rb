class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(
      title: params[:movie][:title],
      release_year: params[:movie][:release_year],
      synopsis: params[:movie][:synopsis],
      country_of_origin: params[:movie][:country_of_origin],
      duration_in_minutes: params[:movie][:duration_in_minutes],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )

    if @movie.save
      flash[:notice] = 'Movie successfully created!'
      return redirect_to new_movie_path
    end

    flash[:alert] = 'There was an error when trying to create the movie'
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(
      title: params[:movie][:title],
      release_year: params[:movie][:release_year],
      synopsis: params[:movie][:synopsis],
      country_of_origin: params[:movie][:country_of_origin],
      duration_in_minutes: params[:movie][:duration_in_minutes],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )
      flash[:notice] = 'Movie successfully updated!'
      return redirect_to(movie_path)
    end

    flash[:alert] = 'There was an error when trying to update the movie.'
    render :edit
  end
end

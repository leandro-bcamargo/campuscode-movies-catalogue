class MoviesController < ApplicationController
  def index
    @movies = Movie.published
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
      if params[:movie][:image].present?
        @movie.image.attach(params[:movie][:image])
      end
      flash[:notice] = 'Movie successfully updated!'
      return redirect_to(movie_path)
    end

    flash[:alert] = 'There was an error when trying to update the movie.'
    render :edit
  end

  def release
    @movie = Movie.find(params[:id])
    if @movie.released?
      @movie.unreleased!
    else
      @movie.released!
    end

    if @movie.save
      flash[:notice] = 'Release status successfully set!'
      return redirect_to movie_path(@movie.id)
    end

    flash[:alert] = 'There was a problem when trying to set the release status.'
    redirect_to movie_path(@movie.id)
  end

  def publish
    @movie = Movie.find(params[:id])
    if @movie.published?
      @movie.draft!
    else
      @movie.published!
    end

    if @movie.save
      flash[:notice] = "Publish status successfully set!"
      return redirect_to movie_path(@movie.id)
    end

    flash[:alert] = "There was a problem when trying to set the publish status."
    redirect_to movie_path(@movie.id)
  end
end

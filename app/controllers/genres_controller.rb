class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.where(genre_id: params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(
      params.require(:genre).permit(:name)
    )
    if @genre.save
      flash[:notice] = 'Genre successfully created!'
      return redirect_to new_genre_path
    end

    flash[:alert] = 'There was an error when trying to create the genre.'
    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(
      params.require(:genre).permit(:name)
    )
      flash[:notice] = 'Genre successfully updated!'
      return redirect_to(genre_path)
    end

    flash[:alert] = 'There was an error when trying to update the genre.'
    render :edit
  end
end

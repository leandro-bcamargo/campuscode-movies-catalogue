class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])
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
      name: params[:genre][:name]
    )
      flash[:notice] = 'Genre successfully updated!'
      return redirect_to(genre_path)
    end

    flash[:alert] = 'There was an error when trying to update the genre.'
    render :edit
  end
end

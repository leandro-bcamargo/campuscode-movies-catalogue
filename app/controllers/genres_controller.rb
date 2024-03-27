class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])
    if @genre.save
      flash[:notice] = 'Genre successfully created!'
      return redirect_to new_genre_path
    end

    flash[:alert] = 'There was an error creating the genre'
    render :new
  end
end

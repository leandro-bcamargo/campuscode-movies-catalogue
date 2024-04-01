class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(
      params.require(:director).permit(:name, :nationality, :birth_date, :favorite_genre_id)
    )

    if @director.save
      flash[:notice] = 'Director successfully created!'
      return redirect_to new_director_path
    end

    flash[:alert] = 'There was an error when trying to create the director.'
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    year = params[:director]["birth_date(1i)"].to_i
    month = params[:director]["birth_date(2i)"].to_i
    day = params[:director]["birth_date(3i)"].to_i

    birth_date = Date.new(year, month, day)

    if @director.update(
      params.require(:director).permit(:name, :nationality, :birth_date, :favorite_genre_id)
    )
      flash[:notice] = 'Director successfully updated!'
      return redirect_to director_path
    end

    flash[:alert] = 'There was an error when trying to update the director.'
    render :edit
  end
end

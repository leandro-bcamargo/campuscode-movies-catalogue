class RenameMovieGenreToGenre < ActiveRecord::Migration[7.1]
  def change
    rename_table :movie_genres, :genres
  end
end

class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_year
      t.text :synopsis
      t.string :country_of_origin
      t.integer :duration_in_minutes
      t.integer :director_id
      t.integer :genre_id

      t.timestamps
    end
  end
end

class RemoveImageUrlFromMovies2 < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :image_url, :string
  end
end

class AddReleaseStatusToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :release_status, :integer, default: 1
  end
end

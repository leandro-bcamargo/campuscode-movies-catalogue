class AddPublishStatusToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :publish_status, :integer, default: 1
  end
end

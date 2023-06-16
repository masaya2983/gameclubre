class AddIsDeletedToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :is_deleted, :boolean
  end
end

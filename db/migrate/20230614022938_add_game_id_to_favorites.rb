class AddGameIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :game_id, :integer
  end
end

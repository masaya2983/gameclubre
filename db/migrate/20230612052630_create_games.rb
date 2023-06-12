class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :review
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end

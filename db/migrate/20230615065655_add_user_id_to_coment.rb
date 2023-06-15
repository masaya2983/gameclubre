class AddUserIdToComent < ActiveRecord::Migration[6.1]
  def change
    add_column :coments, :user_id, :integer
  end
end

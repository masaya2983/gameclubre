class CreateComents < ActiveRecord::Migration[6.1]
  def change
    create_table :coments do |t|

      t.timestamps
    end
  end
end

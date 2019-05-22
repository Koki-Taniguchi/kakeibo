class ChangeIndexToRecodes < ActiveRecord::Migration[5.2]
  def change
    add_index :recodes, [:name, :date, :user_id]
  end
end

class AddUseridToRecodes < ActiveRecord::Migration[5.2]
  def change
    add_column :recodes, :user_id, :integer
  end
end

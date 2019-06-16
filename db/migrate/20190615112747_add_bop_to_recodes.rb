class AddBopToRecodes < ActiveRecord::Migration[5.2]
  def change
    add_column :recodes, :bop, :integer
  end
end

class AddPriceToRecode < ActiveRecord::Migration[5.2]
  def change
    add_column :recodes, :price, :integer
  end
end

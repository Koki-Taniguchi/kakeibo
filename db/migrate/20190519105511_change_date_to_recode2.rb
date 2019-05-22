class ChangeDateToRecode2 < ActiveRecord::Migration[5.2]
  def change
    change_column :recodes, :date, :date
  end
end

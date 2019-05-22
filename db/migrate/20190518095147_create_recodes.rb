class CreateRecodes < ActiveRecord::Migration[5.2]
  def change
    create_table :recodes do |t|
      t.string :name
      t.integer :date
      t.integer :category

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.float :sale_price

      t.timestamps null: false
    end
  end
end

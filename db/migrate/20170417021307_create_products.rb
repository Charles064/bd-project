class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :in_stock
      t.boolean :perish
      t.date :xp_date
      t.timestamps
      
    end
  end
end

class CreateOrderProduct < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.float   :price
      t.integer :quantity
    end
  end
end

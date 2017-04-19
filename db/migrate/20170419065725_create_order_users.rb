class CreateOrderUsers < ActiveRecord::Migration
  def change
    create_table :order_users do |t|
      t.integer :user_id
      t.integer :order_id
    end
  end
end

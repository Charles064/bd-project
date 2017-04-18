class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :t_cost
      t.date :date
      t.string :payment
      t.references :client, index: true, foreign_key: true
      
      t.timestamps
      
    end
  end
end

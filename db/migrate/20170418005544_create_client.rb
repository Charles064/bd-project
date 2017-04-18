class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :names
      t.string :ln1
      t.string :ln2
      t.string :email
      t.string :u_name
      t.string :pwd
      t.date :b_date
      t.timestamps
      
    end
  end
end

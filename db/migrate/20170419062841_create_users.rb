class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :names
      t.string :lastname_1
      t.string :lastname_2
      t.string :email
      t.string :username
      t.string :password
      t.timestamps
    end
  end
end

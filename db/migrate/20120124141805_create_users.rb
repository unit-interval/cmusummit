class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :last_name
      t.string :first_name
      t.boolean :gender
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end

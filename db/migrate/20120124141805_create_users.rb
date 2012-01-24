class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :limit => 255, :null => false
      t.string :encrypted_password, :limit => 255, :null => false
      t.string :salt, :limit => 255, :null => false
      t.string :last_name, :limit => 255, :null => false
      t.string :first_name, :limit => 255, :null => false
      t.boolean :gender
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end

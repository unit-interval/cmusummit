class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :last_name
      t.string :first_name
      t.string :datatype
      t.text :title
      t.text :bio
      t.string :picture

      t.timestamps
    end
  end
end

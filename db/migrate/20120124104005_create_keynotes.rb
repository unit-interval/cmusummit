class CreateKeynotes < ActiveRecord::Migration
  def change
    create_table :keynotes do |t|
      t.text :title, :null => false

      t.timestamps
    end
  end
end

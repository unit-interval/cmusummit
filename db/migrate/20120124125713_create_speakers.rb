class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :last_name, :null => false
      t.string :first_name, :null => false
      t.text :title, :null => false

      t.timestamps
    end
  end
end

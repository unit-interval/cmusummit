class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :last_name, :limit => 255, :null => false
      t.string :first_name, :limit => 255, :null => false
      t.text :title, :limit => 1024, :null => false

      t.timestamps
    end
  end
end

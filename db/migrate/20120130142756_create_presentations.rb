class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :datatype
      t.text :content
      t.string :venue
      t.date :date
      t.time :time

      t.timestamps
    end
    add_index :presentations, :datatype
    add_index :presentations, :date
    add_index :presentations, :time
  end
end

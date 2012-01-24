class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :speaker, :null => false
      t.belongs_to :keynote

      t.timestamps
    end
    add_index :sessions, :speaker_id
    add_index :sessions, :keynote_id
  end
end

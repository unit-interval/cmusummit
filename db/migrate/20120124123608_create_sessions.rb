class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :guest
      t.belongs_to :presentation

      t.timestamps
    end
    add_index :sessions, :guest_id
    add_index :sessions, :presentation_id
  end
end

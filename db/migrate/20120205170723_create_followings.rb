class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.belongs_to :user
      t.belongs_to :presentation
      t.belongs_to :guest

      t.timestamps
    end
    add_index :followings, :user_id
    add_index :followings, :presentation_id
    add_index :followings, :guest_id
  end
end

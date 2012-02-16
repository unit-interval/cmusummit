class AddContactToFollowings < ActiveRecord::Migration
  def change
    add_column :followings, :contact_id, :integer
    add_index :followings, :contact_id
  end
end

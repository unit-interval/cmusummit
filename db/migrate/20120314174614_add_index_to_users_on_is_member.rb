class AddIndexToUsersOnIsMember < ActiveRecord::Migration
  def change
    add_index :users, :is_member
  end
end

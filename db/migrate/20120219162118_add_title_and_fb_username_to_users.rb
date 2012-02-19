class AddTitleAndFbUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :fb_username, :string
    User.update_all :title => 'Innovator'
  end
end

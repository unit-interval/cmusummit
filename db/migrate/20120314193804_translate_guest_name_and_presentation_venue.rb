class TranslateGuestNameAndPresentationVenue < ActiveRecord::Migration
  def up
    Guest.create_translation_table!({
      :last_name => :string,
      :first_name => :string,
      :title => :text,
      :bio => :text,
    }, {
      :migrate_data => true
    })
    Presentation.create_translation_table!({
      :title => :string,
      :content => :text,
      :venue => :string,
    }, {
      :migrate_data => true
    })
  end

  def down
    Guest.drop_translation_table! :migrate_data => true
    Presentation.drop_translation_table! :migrate_data => true
  end
end

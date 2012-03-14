class TranslateGuestsAndPresentationsWithGlobalize3 < ActiveRecord::Migration
  def up
    Guest.create_translation_table!({
      :title => :text,
      :bio => :text,
    }, {
      :migrate_data => true
    })
    Presentation.create_translation_table!({
      :title => :string,
      :content => :text,
    }, {
      :migrate_data => true
    })
  end

  def down
    Guest.drop_translation_table! :migrate_data => true
    Presentation.drop_translation_table! :migrate_data => true
  end
end

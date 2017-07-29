class CreateFbReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :fb_reactions do |t|
      t.string :fb_uid
      t.string :fb_uname
      t.string :type
      t.references :meta_data_photo, foreign_key: true

      t.timestamps
    end
  end
end

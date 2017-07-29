class CreateFbComments < ActiveRecord::Migration[5.0]
  def change
    create_table :fb_comments do |t|
      t.string :fb_uid
      t.string :fb_uname
      t.integer :like_count
      t.integer :comment_count
      t.string :message
      t.references :meta_data_photo, foreign_key: true

      t.timestamps
    end
  end
end

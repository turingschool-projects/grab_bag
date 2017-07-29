class AddColumnsToMetaDataPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_data_photos, :image, :string
    add_column :meta_data_photos, :created_time, :string
    add_column :meta_data_photos, :fb_uname, :string
    add_column :meta_data_photos, :fb_uid, :string
    add_column :meta_data_photos, :fb_photo_id, :string
    add_reference :meta_data_photos, :fb_place, index: true
  end
end

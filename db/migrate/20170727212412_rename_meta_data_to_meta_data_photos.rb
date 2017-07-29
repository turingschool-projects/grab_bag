class RenameMetaDataToMetaDataPhotos < ActiveRecord::Migration[5.0]
  def change
    rename_table :meta_data, :meta_data_photos
  end
end

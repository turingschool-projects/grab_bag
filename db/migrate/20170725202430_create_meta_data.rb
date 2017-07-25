class CreateMetaData < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_data do |t|
      t.references :user, foreign_key: true
      t.integer :width
      t.integer :height
      t.string :model
      t.string :shutter_speed
      t.float :aperture
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end

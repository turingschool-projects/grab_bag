class CreateFbPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :fb_places do |t|
      t.string :fb_place_id
      t.string :name
      t.string :city
      t.string :country
      t.float :lat
      t.float :long
    end
  end
end

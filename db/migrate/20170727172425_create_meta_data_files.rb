class CreateMetaDataFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_data_files do |t|
      t.references :user, foreign_key: true
      t.references :binaries, foreign_key: true
      t.string :text
      t.integer :word_count
      t.string :top_adjective, array: true, default: []
      t.string :top_noun, array: true, default: []
      t.timestamps
    end
  end
end

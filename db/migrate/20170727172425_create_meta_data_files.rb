class CreateMetaDataFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_data_files do |t|
      t.references :user, foreign_key: true
      t.references :binaries, foreign_key: true
      t.string :text
      t.integer :word_count
      t.string :top_adjective
      t.string :top_noun
      t.timestamps
    end
  end
end

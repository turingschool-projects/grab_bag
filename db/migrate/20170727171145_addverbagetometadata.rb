class Addverbagetometadata < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_data, :text, :string
    add_column :meta_data, :word_count, :integer
    add_column :meta_data, :top_adjective, :string
    add_column :meta_data, :top_noun, :string
  end
end

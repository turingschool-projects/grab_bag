class ChangeTypeColumnInFbReactions < ActiveRecord::Migration[5.0]
  def change
    rename_column :fb_reactions, :type, :reaction_type
  end
end

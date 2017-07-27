class MetaDataPhoto < ApplicationRecord
  has_many :fb_comments
  has_many :fb_tags
  has_many :fb_reactions
  belongs_to :fb_place
  
end

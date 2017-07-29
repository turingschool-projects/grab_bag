class MetaDataPhoto < ApplicationRecord
  has_many :fb_comments
  has_many :fb_tags
  has_many :fb_reactions
  has_one :fb_place

  def self.photos_with_a_location(user)
    where(user_id: user.id).where.not(lat: nil)
  end
end

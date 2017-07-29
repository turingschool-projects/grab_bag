class MetaDataPhoto < ApplicationRecord
  has_many :fb_comments
  has_many :fb_tags
  has_many :fb_reactions
  has_one :fb_place

  def self.photos_with_a_location(user)
    where(user_id: user.id).where.not(lat: nil)
  end

  def self.photos_by_year(user)
    locations = {}
    photos_with_a_location(user).order(created_at: :asc).each do |photo|
      if locations["#{photo.created_at.year}"]
        locations["#{photo.created_at.year}"] << {"latitude" => photo.lat, "longitude" => photo.long}
      else
        locations["#{photo.created_at.year}"] = []
        locations["#{photo.created_at.year}"] << {"latitude" => photo.lat, "longitude" => photo.long}
      end
    end
    locations
  end
end

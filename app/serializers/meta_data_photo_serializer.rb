class MetaDataPhotoSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :created_at

  def latitude
    object.lat
  end

  def longitude
    object.long
  end
end

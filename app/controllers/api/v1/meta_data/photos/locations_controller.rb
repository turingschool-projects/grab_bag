class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
    @locations = MetaDataPhoto.photos_with_a_location(current_user).order(id: :asc)
    render json: @locations
  end

  def show
    @locations = MetaDataPhoto.photos_with_a_location(current_user).order(created_at: :asc).map do |photo|
      {"#{photo.created_at.year}" => {"latitude" => photo.lat, "longitude" => photo.long}}
    end
    render json: @locations
  end
end

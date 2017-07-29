class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
    @locations = MetaDataPhoto.photos_with_a_location(current_user).order(id: :asc)
    render json: @locations
  end

  def show
    @locations = MetaDataPhoto.photos_by_year(current_user)
    render json: @locations
  end
end

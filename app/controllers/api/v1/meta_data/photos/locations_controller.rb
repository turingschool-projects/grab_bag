class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
    @locations = MetaDataPhoto.where(user_id: current_user.id).where.not(lat: nil).order(id: :asc)
    render json: @locations
  end
end

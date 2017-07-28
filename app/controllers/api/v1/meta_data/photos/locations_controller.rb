class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
    @locations = MetaData.where(user_id: current_user.id).where.not(lat: nil)
    render json: @locations
  end
end

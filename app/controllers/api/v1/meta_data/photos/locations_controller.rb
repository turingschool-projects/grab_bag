class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
<<<<<<< HEAD
    @locations = MetaDataPhoto.where(user_id: current_user.id).where.not(lat: nil).order(id: :asc)
=======
    @locations = MetaData.where(user_id: current_user.id).where.not(lat: nil)
>>>>>>> 5be1a6821bef50c3d0daf405744520484990f219
    render json: @locations
  end
end

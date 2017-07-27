class Api::V1::MetaData::Photos::LocationsController < ApplicationController
  def index
    locations = MetaData.where(user_id: current_user.id).where.not(lat: nil)
    @locs = []
    locations.each do |loc|
      @locs << {latitude: loc.lat, longitude: loc.long}
    end
    render json: @locs
  end
end

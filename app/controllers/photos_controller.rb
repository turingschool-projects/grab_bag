class PhotosController < ApplicationController
  def index
    @photos = Photos.get_data(current_user)
  end
end

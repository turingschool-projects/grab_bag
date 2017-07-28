class Api::V1::FileController < ApplicationController

  def topwords
    render json: UploadLogicHelper.new(current_user).topword_adjective
  end

end

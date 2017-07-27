class Api::V1::FileController < ApplicationController

  def topwords
    UploadLogicHelper.new(current_user).topwords
  end

end

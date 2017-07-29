class Api::V1::FileController < ApplicationController

  def topwords_adjectives
    render json: UploadLogicHelper.new(current_user).adjectives
  end

  def topwords_nouns
    render json: UploadLogicHelper.new(current_user).nouns
  end

  def american?
    render json: UploadLogicHelper.new(current_user).american?
  end

end

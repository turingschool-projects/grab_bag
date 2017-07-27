class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
  end

  def topwords
    binding.pry
    MetaDataFile.where(user_id: user.id).order(:top_adjective).limit(5)
  end

  private
  attr_reader :user
end

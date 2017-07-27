class UploadLogicHelper

  def initialize(current_user)
    @user = current_user
  end

  def topwords
    binding.pry
  end

  private
  attr_reader :user
end

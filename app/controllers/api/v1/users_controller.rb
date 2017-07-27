class Api::V1::UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find(current_user.id)
    render json: @user
  end
end

class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.session_token
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

end

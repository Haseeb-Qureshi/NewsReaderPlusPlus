class Api::SessionsController < ApplicationController
  def authenticate
    render json: "", status: (current_user ? 200 : 401)
  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      render json: user.session_token
    else
      render json: "Invalid login"
    end
  end

  def destroy
    logout(current_user)
  end
end

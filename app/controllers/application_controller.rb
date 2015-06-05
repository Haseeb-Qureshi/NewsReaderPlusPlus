class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    @current_user ||= User.find_by(session_token: params[:session_token])
  end

  def logout(user)
    user.reset_session_token
    @current_user = nil
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def check_logged_in
    unless @current_user
      render json: "Not logged in", status: 401
    end
  end
end

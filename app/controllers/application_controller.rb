class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find session[:user_id] if user_signed?
  end
  helper_method :current_user

  def user_signed?
    session[:user_id].present?
  end
  helper_method :user_signed?

  def authenticate_user!
    redirect_to new_session_path, notice: "Please Sign In!!" unless user_signed?
  end

  def user_like(c)
  Like.where(["user_id = ? and comment_id =?", current_user.id, c])[0] if current_user
  end
  helper_method :user_like

  def user_favourite
    @user_favourite ||= @product.favourite_for(current_user)
  end
  helper_method :user_favourite

end

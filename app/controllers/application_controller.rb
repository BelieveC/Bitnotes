class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_user!
  helper_method :current_user?
  helper_method :subscribed?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(other_user)
    if other_user.id == current_user.id
      true
    else
      false
    end
  end

  def subscribed?(other_user)
    current_user.subscribed.include?(other_user)
  end

  def user_signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

   def authenticate_user!
    if session[:user_id]
      return true
    else
      redirect_to root_path,notice:"Please Sign In before you Contribute!"
    end
  end
end

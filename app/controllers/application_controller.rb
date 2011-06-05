class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def check_authenticated
    redirect_to home_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by_id( session["user_id"] )
  end
  helper_method :current_user

  def current_user=( user = nil )
    return nil if user.nil?
    @current_user = user
    session["user_id"] = user.id
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

end


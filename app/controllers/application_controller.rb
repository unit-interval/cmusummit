class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_path
    end
  end
  def admin_only
    unless session[:user_is_admin]
      redirect_to todo_path
    end
  end
end

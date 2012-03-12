class ApplicationController < ActionController::Base
  before_filter :set_locale, :authorize
  protect_from_forgery
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options(options = {})
    options.merge!({ :locale => I18n.locale })
  end
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

class IndexController < ApplicationController
  skip_before_filter :authorize

  def index
  end

  def agenda
  end

  def contest
  end

  def team
  end

  def info
  end
  
  def todo
  end

  def login
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def sessions
    @keynotes = Keynote.all
  end

  def sign_in
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      session[:user_is_admin] = user.is_admin
      redirect_to agenda_path
    else
      redirect_to login_path
    end
  end
end

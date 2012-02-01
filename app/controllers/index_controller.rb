class IndexController < ApplicationController
  skip_before_filter :authorize

  def index
  end

  def agenda
    presentations = Presentation.all
    @panels = presentations.find_all { |p| p.datatype == 'panel' }
    @keynotes = presentations.find_all { |p| p.datatype == 'keynote' }
    @misc_sessions = presentations - @panels - @keynotes
  end

  def contest
  end

  def info
  end

  def login
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def people
    @guests = Guest.all
  end

  def sign_in
    if params[:user]
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        UserMailer.after_registration(@user).deliver if Rails.env == 'production'
        redirect_to agenda_path
      else
        render 'login'
      end
    else
      if user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
        session[:user_is_admin] = user.is_admin
        redirect_to agenda_path
      else
        redirect_to login_path
      end
    end
  end
  
  def team
  end

  def todo
  end
end

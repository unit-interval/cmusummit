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
    guests = Guest.all
    @speakers = guests.find_all { |p| p.datatype == "keynote" }
    @panelists = guests - @speakers
    @participants = User.all
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
    elsif params[:password]
      if user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
        session[:user_is_admin] = user.is_admin
        redirect_to agenda_path
      else
        flash[:user_email] = params[:email]
        flash[:error_signin] = true
        redirect_to login_path
      end
    else
      if @user = User.find_by_email(params[:email])
        ## TODO add mailer
        #UserMailer.retrieve_password(@user).deliver if Rails.env == 'production'
        flash[:retrieve_password_notice] = 'Password has been sent to you.'
      else
        flash[:retrieve_password_notice] = 'Email address not found.'
      end
      flash[:user_email] = params[:email]
      redirect_to login_path
    end
  end
  
  def team
  end

  def todo
  end
end

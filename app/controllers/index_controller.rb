class IndexController < ApplicationController
  skip_before_filter :authorize, :except => [:todo]

  def index
    @layout = "home"
  end

  def agenda
    @layout = "agenda"
    presentations = Presentation.all
    @panels = presentations.find_all { |p| p.datatype == 'panel' }
    @keynotes = presentations.find_all { |p| p.datatype == 'keynote' }
    @misc_sessions = presentations - @panels - @keynotes
  end

  def contest
    @layout = "contest"
    user = session[:user_id] ? User.find(session[:user_id]) : User.new
    @submission = Submission.new(user.attributes)
  end

  def info
    @layout = "info"
  end

  def login
    @layout = "get_involved"
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    session[:user_is_admin] = nil
    redirect_to root_path
  end

  def people
    @layout = "people"
    guests = Guest.all
    @speakers = guests.find_all { |p| p.datatype == "keynote" }
    @panelists = guests.find_all { |p| p.datatype == "panel" }
    @participants = User.all
  end

  def sign_in
    if params[:user]
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        UserMailer.after_registration(@user).deliver if Rails.env == 'production'
        redirect_to todo_path
      else
        render 'login'
      end
    elsif params[:password]
      if user = User.authenticate(params[:email], params[:password])
        session[:user_id] = user.id
        session[:user_is_admin] = user.is_admin
        redirect_to todo_path
      else
        flash[:user_email] = params[:email]
        flash[:error_signin] = true
        redirect_to login_path
      end
    else
      if @user = User.find_by_email(params[:email])
        @user.password = @user.password_confirmation = User.generate_temp_password
        @user.save
        UserMailer.retrieve_password(@user).deliver if Rails.env == 'production'
        flash[:retrieve_password_notice] = 'Password has been sent to you.'
      else
        flash[:retrieve_password_notice] = 'Email address not found.'
      end
      flash[:user_email] = params[:email]
      redirect_to login_path
    end
  end
  
  def submit
    @layout = "contest"
    @submission = Submission.new params[:submission]
    if @submission.valid?
      ContestMailer.submit_executive_summary(@submission).deliver if Rails.env == 'production'
      UserMailer.confirm_submission(@submission.email).deliver if Rails.env == 'production'
      redirect_to contest_path(:anchor => 'submission'), :notice => 'Your Executive Summary is successfully submitted.'
    else
      render :contest
    end
  end

  def team
    @layout = "team"
    @advisors = Guest.find_all_by_datatype('advisor')
    @members = User.members.all
  end

  def todo
    @layout = "account"
    @user = User.find(session[:user_id])
  end
end

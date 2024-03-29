class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:create]
  before_filter :admin_only, :except => [:update, :follow, :unfollow]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.after_registration(@user).deliver if Rails.env == 'production'
        format.html { redirect_to agenda_path, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { redirect_to login_path }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(session[:user_id])
    case params[:task]
    when 'update_profile'
      if @user.update_attributes(params[:user])
        redirect_to todo_path
      else
        render :action => "edit"
      end
    when 'update_password'
      unless User.authenticate(@user.email, params[:password_old])
        redirect_to todo_path
        return
      end
      if @user.update_attributes(params[:user])
        redirect_to todo_path
      else
        render :action => "edit"
      end
    else
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to @user, :notice => 'User was successfully updated.'
      else
        render :action => "edit"
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # GET /users/1/follow
  def follow
    if params[:id].to_i == session[:user_id]
      render :json => { :ok => false, :error => "can't follow yourself." }
      return
    end
    user = User.find(params[:id])
    follower = User.find(session[:user_id])
    user.followers << follower
    render :json => { :ok => true, :follower_count => user.followers.count }
  end

  # GET /users/1/unfollow
  def unfollow
    user = User.find(params[:id])
    follower = User.find(session[:user_id])
    user.followers.delete follower
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => { :ok => true } }
    end
  end
end

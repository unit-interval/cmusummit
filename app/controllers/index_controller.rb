class IndexController < ApplicationController
  skip_before_filter :authorize, :except => [:todo]

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
    session[:user_is_admin] = nil
    redirect_to root_path
  end

  def people
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
    @advisors = Guest.find_all_by_datatype('advisor')
    mailist = [
      "bowang@andrew.cmu.edu",
      "chenw@cmu.edu",
       "chwang1206@gmail.com",
       "cora330@gmail.com",
       "cyclone82@gmail.com",
       "dorisdiao@gmail.com",
       "dourabbit@gmail.com",
       "duoding.cmu@gmail.com",
       "eric.marui@gmail.com",
       "fengfiss@gmail.com",
       "francishan@gmail.com",
       "guibowen.anna@gmail.com",
      "hongwenk@cs.cmu.edu",
      "hrjaco@gmail.com",
      "ingayang@gmail.com",
      "jacqueline.chan.sh@gmail.com",
      "jarod.d.wang@gmail.com",
       "jayzhao@cmu.edu",
      "jino.1229@gmail.com",
      "jlin0860@gmail.com",
       "judyyuncai@gmail.com",
      "junzhao.cmu@gmail.com",
       "kejiaw@andrew.cmu.edu",
       "kkgreat@hotmail.com",
      "lanliu1116@gmail.com",
      "libragold@gmail.com",
      "lipeilin1987@gmail.com",
      "luny1985@gmail.com",
      "luyumengcmu@gmail.com",
      "manguo85@gmail.com",
      "mengruiz@andrew.cmu.edu",
      "msun@andrew.cmu.edu",
       "myfriend10099@gmail.com",
       "pumbaa1616@gmail.com",
       "qwu@ece.cmu.edu",
      "shangg85@gmail.com",
      "shirleyswr@gmail.com",
      "shuxingdeng@gmail.com",
      "tao@huangtao.me",
       "tianshen65@gmail.com",
      "versatilewang@gmail.com",
       "weiwei@cs.cmu.edu",
      "wizardlast@gmail.com",
      "wxneverlost@gmail.com",
      "xingcmu@gmail.com",
      "xinzheng@andrew.cmu.edu",
      "xinzhuli.cmu@gmail.com",
      "xit@andrew.cmu.edu",
      "yanghu.energy@gmail.com",
      "yiming.jing@gmail.com",
      "yingjie1@andrew.cmu.edu",
      "yinxiaoqi522@gmail.com",
      "yufan@andrew.cmu.edu",
       "ywang0503@gmail.com",
       "zhangtienv@gmail.com",
      "zhangxiong01@gmail.com",
      "zhangzhuolightning@gmail.com",
       "zlwe88@gmail.com"
    ]
    @members = User.all.find_all { |p| mailist.include? p.email }
  end

  def todo
    @user = User.find(session[:user_id])
  end
end

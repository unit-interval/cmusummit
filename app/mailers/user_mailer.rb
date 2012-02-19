class UserMailer < ActionMailer::Base
  default :from => "info@cmusummit.org"

  def after_registration(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to CMU Summit")
  end
  def retrieve_password(user)
    @user = user
    @datetime = DateTime.now
    mail(:to => user.email, :subject => "You requested a password reset for your CMU Summit account")
  end
end

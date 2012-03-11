class UserMailer < ActionMailer::Base
  default :from => "CMU Summit <info@cmusummit.org>"

  def after_registration(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to CMU Summit")
  end
  def confirm_submission(email)
    mail(:to => email, :subject => "Your Executive Summary is successfully submitted")
  end
  def retrieve_password(user)
    @user = user
    @datetime = DateTime.now
    mail(:to => user.email, :subject => "You requested a password reset for your CMU Summit account")
  end
end

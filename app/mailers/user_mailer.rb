class UserMailer < ActionMailer::Base
  default :from => "info@cmusummit.org"

  def after_registration(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to CMU Summit")
  end
end

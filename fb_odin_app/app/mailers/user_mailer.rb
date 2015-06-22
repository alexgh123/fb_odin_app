class UserMailer < ApplicationMailer
  default from: 'notifications@eample.com'

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login' #link to site
    mail(to: @user.email, subject: "Welcome to my sweet site!")
  end

end


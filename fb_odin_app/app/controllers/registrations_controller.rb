class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.welcome_email(@user).deliver
  end

end


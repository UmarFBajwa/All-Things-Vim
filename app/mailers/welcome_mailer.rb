class WelcomeMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to the Vim Shop')
  end
end

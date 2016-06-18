class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, service)
    @user = user
    WelcomeMailer.welcome_email(@user).deliver_later
  end
end

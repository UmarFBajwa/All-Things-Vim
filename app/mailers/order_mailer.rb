class OrderMailer < ApplicationMailer
  def order_confirmation(user)
    @user = user
    @order = user.orders.last
    mail(to: @user.email, subject: 'Your order confirmation')
  end
end

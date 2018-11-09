class UserMailer < ApplicationMailer
  default from: ENV['gmail_username']

  def welcome_email(id)
    @user = User.find(id)
    @url  = 'http://buzovastore.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def order_confirmation(order)
    @order = order
    @url  = 'http://buzovastore.com'
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
end

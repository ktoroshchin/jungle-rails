class UserMailer < ApplicationMailer
  default from: ENV['gmail_username']

  def welcome_email(id)
    @user = User.find(id)
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def order_confirmation(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
end

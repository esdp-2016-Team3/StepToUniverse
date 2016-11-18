class UserMailer < ApplicationMailer
  # default from: 'socialhubs2016@gmail.com'
  #
  # def welcome_email(user,id,org,author)
  #   @author=author
  #   @user = user
  #   # @admin = AdminUser.first
  #   @org = org
  #   @id = id
  #   @url  = 'http:46.101.108.2/admin/organizations/' + @id.to_s + '/edit'
  #   @url1  = 'http:localhost:3000/admin/organizations/' + @id.to_s + '/edit'
  #   mail(to: user.email, subject: 'Welcome to My Awesome Site')
  # end
  # def notification(user,id,org)
  #   @user = user
  #   @org = org
  #   @id = id
  #   mail(to: @user.email,subject: 'organization confirmed')
  # end
  default from: "esdp20163@gmail.com"

  def reg_alert(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def confirm_alert(user)
    @user = user
    mail(to: user.email, subject: 'Подтверждение')
  end

  def reject_alert(user)
    @user = user
    mail(to: user.email, subject: 'Отказ')
  end
end

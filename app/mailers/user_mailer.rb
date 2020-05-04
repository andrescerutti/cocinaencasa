class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenido a Cocina En Casa!')
  end
end

class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenido a Cocina En Casa!')
  end
  def error_on_buying
    @user = params[:payment]
    @order = order[:order]
    mail(to: "ceruttiandres@gmail.com", subject: '¡Error en una venta!')
  end
end

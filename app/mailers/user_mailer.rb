class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenido a Cocina En Casa!')
  end
  def error_on_buying
    @user = params[:payment]
    @order = params[:order]
    @store = params[:store]
    @payment = params[:payment]
    @payment = Payment.new if params[:payment].nil?
    @data = params[:data]
    mail(to: "ceruttiandres@gmail.com", subject: '¡Error en una venta!')
  end
end

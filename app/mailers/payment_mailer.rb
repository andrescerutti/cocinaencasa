class PaymentMailer < ApplicationMailer
  def confirmed
    @user = params[:user]
    @payment = params[:payment]
    mail(to: @user, subject: "Tu pago fue aprobado!")
  end
end

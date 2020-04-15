class PaymentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.confirmed.subject
  #
  def confirmed

    @payment = params[:payment]

    mail(to: @payment, subject: 'Tu pago fue aprobado!')
  end
end

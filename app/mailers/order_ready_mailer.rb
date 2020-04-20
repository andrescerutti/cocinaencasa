class OrderReadyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_ready_mailer.order_ready.subject
  #
  def order_ready
    @order = params[:order]
    mail(to: @order.user.email, subject: 'Tu kit ya esta listo para ser retirado!')
  end
end

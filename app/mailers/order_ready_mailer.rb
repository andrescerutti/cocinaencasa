class OrderReadyMailer < ApplicationMailer

  def order_ready
    @order = params[:order]
    mail(to: @order.user.email, subject: 'Tu kit ya esta listo para ser retirado!')
  end
end

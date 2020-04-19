class OrderReadyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_ready_mailer.order_ready.subject
  #
  def order_ready
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

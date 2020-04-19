# Preview all emails at http://localhost:3000/rails/mailers/order_ready_mailer
class OrderReadyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_ready_mailer/order_ready
  def order_ready
    OrderReadyMailer.order_ready
  end

end

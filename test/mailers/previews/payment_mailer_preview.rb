# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/confirmed
  def confirmed
    PaymentMailer.with(payment: Payment.first, user: User.first).confirmed
  end

end

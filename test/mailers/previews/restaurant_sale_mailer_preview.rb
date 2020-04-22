# Preview all emails at http://localhost:3000/rails/mailers/restaurant_sale_mailer
class RestaurantSaleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/restaurant_sale_mailer/new_sale
  def new_sale
    RestaurantSaleMailer.with(restaurant: Restaurant.first, order: Order.first, payment: Payment.first).new_sale
  end
end

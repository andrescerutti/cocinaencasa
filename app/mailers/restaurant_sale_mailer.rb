class RestaurantSaleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.restaurant_sale_mailer.new_sale.subject
  #
  def new_sale
    @order = params[:order]
    @user = params[:user]
    @restaurant = params[:restaurant]
    mail(to: @restaurant.user.email, subject: 'Realizaste una nueva venta!')
  end
end

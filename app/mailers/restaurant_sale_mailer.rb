class RestaurantSaleMailer < ApplicationMailer
  def new_sale
    @payment = params[:payment]
    @order = params[:order]
    @user = params[:user]
    @restaurant = params[:restaurant]
    # mail(to: @restaurant.user.email, subject: 'Realizaste una nueva venta!')
  end
end

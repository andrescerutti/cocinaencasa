module MercadoPagoHelper
  def self.create(params, order, key)
    require 'rest-client'
    payload = { "transaction_amount": (order.amount * order.kit.price).to_f, "token": params['token'], "description": order.kit.name, "installments": params['installments'].to_i, "payment_method_id": params['payment_method_id'], "issuer_id": params['issuer_id'], "payer": {"email": order.user.email} }
    headers = { 'accept': 'application/json', 'content-type': 'application/json' }
    url = "https://api.mercadopago.com/v1/payments?access_token=#{key}"
    payment_attempt = RestClient.post(url, payload.to_json, headers)
    if payment_attempt["status"] == "approved"
      @payment = create_payment(@order, payment_attempt)
    elsif payment_attempt["status"] == "in_process"
      sleep(3)
      if payment_attempt["status"] == "approved"
        @payment = create_payment(@order, payment_attempt)
      end
    else
      @payment = Payment.new()
      @payment.order = @order
      @payment.approved = false
      @payment.save
    end

  end

  def create_payment(order, payment_attempt)
    @payment = Payment.new()
    @payment.order = @order
    @payment.approved = true
    @payment.status = payment_attempt["status"]
    @payment.external_id = payment_attempt["id"]
    @payment.date_approved = payment_attempt["date_approved"]
    @payment.operation_type = payment_attempt["operation_type"]
    @payment.payment_method_id = payment_attempt["payment_method_id"]
    @payment.payment_type_id = payment_attempt["payment_type_id"]
    @payment.status_detail = payment_attempt["status_detail"]
    raise
    @payment.save
    return @payment
  end
end

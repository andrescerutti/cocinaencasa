class Payment < ApplicationRecord
  belongs_to :order

  def guide
    order.kit.guide
  end

  def update_approved(state)
    update(approved: state)
  end

  def done_with
    types = {"debit_card" => "Debito", "credit_card" => "Credito", "cash" => "Efectivo"}
    types[payment_type_id]
  end

  def card
    types = { "visa" => "VISA", "debvisa" => "VISA", "amex" => "AMEX", "master" => "MASTER", "cash" => "EFECTIVO" }
    type = types[payment_method_id]
    type ||= payment_method_id
    return type
  end

end

class Order < ApplicationRecord
  belongs_to :kit
  belongs_to :user, optional: true

  has_one :review, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_one :address, as: :addressable, :dependent => :destroy

  accepts_nested_attributes_for :address
  validates :code, uniqueness: true, presence: true
  enum status: { pending: 0, on_transit: 1, delivered: 3, canceled: 4, refunded: 5 }

  scope :deliverable, -> { where(delivery_provider: "Glovo") }
  PROVIDER2 = ["Glovo", "Retirar por el local"]
  PROVIDER = ["Envio a domicilio", "Retirar por el local"]

  def order_ready
    OrderReadyMailer.with(user: self).order_ready.deliver_now
  end

  def pick_up
    delivery_provider == "Retirar por el local"
  end

  def delivery
    delivery_provider == "Envio a domicilio"
  end

  def client_comment
    comment.nil? ? "Sin comentarios." : "'#{comment}'"
  end

  def estado
    delivery_status = {"pending" => "PENDIENTE", "on_transit" => "A ENTREGAR", "delivered" => "ENTREGADA", "canceled" => "CANCELADA"}
    delivery_status[status]
  end
end

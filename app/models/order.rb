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
end

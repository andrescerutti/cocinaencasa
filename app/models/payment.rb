class Payment < ApplicationRecord
  belongs_to :order

  def guide
    order.kit.guide
  end

  def update_approved(state)
    update(approved: state)
  end
end

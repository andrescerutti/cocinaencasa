class Store < ApplicationRecord
  belongs_to :restaurant
  has_one :address, as: :addressable, :dependent => :destroy
end

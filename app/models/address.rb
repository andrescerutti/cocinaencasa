class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :store, optional: true
  belongs_to :restaurant, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user, optional: true

  # validates :address, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :cp, presence: true
  # validates :latitude, numericality: true
  # validates :longitude, numericality: true
  scope :restaurants, -> { where(addressable_type: 'Store') }

  def self.search(input)
    Geocoder.search(input).first.coordinates
  end

end


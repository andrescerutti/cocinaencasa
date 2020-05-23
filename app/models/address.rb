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
    begin
      google_api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{I18n.transliterate(input)}&key=#{ENV['GOOGLE_GEOCODER_API_KEY']}"
      data = JSON.parse(open(google_api_url).read)["results"]
      latLng = data.first["geometry"]["location"].values
    rescue
      [-34.5784991, -58.4046482]
    end
  end

end


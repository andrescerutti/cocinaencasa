class Kit < ApplicationRecord
  belongs_to :restaurant
  # accepts_nested_attributes_for :guides
  # accepts_nested_attributes_for :steps
  reverse_geocoded_by "addresses.latitude", "addresses.longitude"

  include PgSearch::Model
  pg_search_scope :search,
    against: [:name],
    associated_against: {
      restaurant: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  mount_uploader :image, ImageUploader # carrierwave para subir fotos

  has_many :kit_cookwares, dependent: :destroy
  has_many :kit_ingredients, dependent: :destroy
  has_many :kit_categories, dependent: :destroy
  has_one :guide, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :ingredients, through: :kit_ingredients
  has_many :cookware, through: :kit_cookwares
  has_many :categories, through: :kit_categories
  has_many :steps, through: :guides
  has_many :reviews, through: :orders

  validates :name, presence: true
  validates :stock, presence: true, numericality: true
  validates :size, presence: true, numericality: true
  validates :preparation_time, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end

  def update_stock(amount_variation)
    new_amount = stock - amount_variation
    update(stock: new_amount)
  end
end

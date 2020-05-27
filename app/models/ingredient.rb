class Ingredient < ApplicationRecord
  has_many :kit_ingredients, inverse_of: :ingredient, dependent: :destroy
  accepts_nested_attributes_for :kit_ingredients
  mount_uploader :image, ImageUploader

  validates :name, presence: true
end

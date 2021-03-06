class Cookware < ApplicationRecord
  has_many :kit_cookwares, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :name, presence: true
end

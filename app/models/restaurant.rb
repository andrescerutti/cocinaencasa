class Restaurant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :brand
  has_many :stores, dependent: :destroy
  geocoded_by :address
  has_many :address, through: :stores

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :address
  has_many :kits, dependent: :destroy
  has_many :orders, through: :kits

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  encrypts :test_mp_public_key
  encrypts :test_mp_private_key
  encrypts :prod_mp_public_key
  encrypts :prod_mp_private_key
end

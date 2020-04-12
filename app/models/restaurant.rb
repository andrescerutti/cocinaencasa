class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  geocoded_by :address

  mount_uploader :image, ImageUploader

  has_one :address, as: :addressable, :dependent => :destroy
  accepts_nested_attributes_for :address
  has_many :kits
  has_many :orders, through: :kits

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

   encrypts :test_mp_public_key_ciphertext
   encrypts :test_mp_private_key_ciphertext
   encrypts :prod_mp_public_key_ciphertext
   encrypts :prod_mp_private_key_ciphertext

end

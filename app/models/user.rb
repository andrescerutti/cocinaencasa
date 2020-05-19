
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  mount_uploader :avatar_image, ImageUploader # carrierwave para subir fotos

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites
  has_many :orders
  has_many :addresses, as: :addressable
  has_many :cards
  has_many :restaurants

  validates :email, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :permision_level, presence: true, numericality: true, inclusion: { in: (1..5) }

  after_create :send_welcome_email

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end


  def recurrent
    orders.count.positive? ? "Conocido" : "Primera vez"
  end
end

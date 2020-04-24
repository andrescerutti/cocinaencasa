class Guide < ApplicationRecord
  belongs_to :kit

  has_many :steps, dependent: :destroy

  # validates :video, presence: true
end

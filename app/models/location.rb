class Location < ApplicationRecord
  has_many :products_movements, dependent: :destroy

  validates :title, presence: true
end

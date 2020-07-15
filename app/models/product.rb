class Product < ApplicationRecord
  has_many :products_movements, dependent: :destroy

  validates :title, :supply_price, :shipment_price, presence: true
end

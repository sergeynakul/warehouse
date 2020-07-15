class ProductsMovement < ApplicationRecord
  belongs_to :product
  belongs_to :location

  validates :product, :quantity, :location, :created_at, presence: true
end

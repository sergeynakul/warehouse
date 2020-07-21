FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product #{n}" }
    supply_price { 10 }
    shipment_price { 12 }
  end
end

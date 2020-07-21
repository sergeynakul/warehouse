FactoryBot.define do
  factory :products_movement do
    location
    product
    quantity { 15 }
    created_at { Date.current }
  end
end

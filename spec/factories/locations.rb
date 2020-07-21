FactoryBot.define do
  factory :location do
    sequence(:title) { |n| "Location #{n}" }
    address { 'Location address' }
  end
end

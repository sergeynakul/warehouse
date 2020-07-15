require 'rails_helper'

RSpec.describe ProductsMovement, type: :model do
  it { is_expected.to belong_to(:product) }
  it { is_expected.to belong_to(:location) }

  it { is_expected.to validate_presence_of(:product) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:created_at) }
end

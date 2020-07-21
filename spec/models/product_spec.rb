require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to have_many(:products_movements).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:supply_price) }
  it { is_expected.to validate_presence_of(:shipment_price) }
end

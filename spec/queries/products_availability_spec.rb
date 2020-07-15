require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe ProductsAvailability do
  let(:location_first) { create(:location) }
  let(:location_second) { create(:location) }
  let(:product_first) { create(:product) }
  let(:product_second) { create(:product) }
  let(:product_third) { create(:product) }

  before do
    create(:products_movement, location: location_first,
                               product: product_first,
                               quantity: 20,
                               created_at: Date.current - 30.days)
    create(:products_movement, location: location_first,
                               product: product_second,
                               quantity: 30,
                               created_at: Date.current - 20.days)
    create(:products_movement, location: location_first,
                               product: product_third,
                               quantity: 10,
                               created_at: Date.current - 10.days)
    create(:products_movement, location: location_first,
                               product: product_first,
                               quantity: -5,
                               created_at: Date.current - 15.days)
    create(:products_movement, location: location_first,
                               product: product_second,
                               quantity: -20,
                               created_at: Date.current - 10.days)
    create(:products_movement, location: location_second,
                               product: product_first,
                               quantity: 30,
                               created_at: Date.current - 30.days)
    create(:products_movement, location: location_second,
                               product: product_second,
                               quantity: 50,
                               created_at: Date.current - 25.days)
    create(:products_movement, location: location_second,
                               product: product_second,
                               quantity: -5,
                               created_at: Date.current - 20.days)
    create(:products_movement, location: location_second,
                               product: product_second,
                               quantity: -15,
                               created_at: Date.current - 15.days)
    create(:products_movement, location: location_second,
                               product: product_second,
                               quantity: -25,
                               created_at: Date.current - 10.days)
  end

  it 'on current date' do
    response = described_class.new(ProductsMovement.all).call(date: Date.current)

    expect(response).to eq({ location_first.id => [{ product_second.id => 10 },
                                                   { product_first.id => 15 },
                                                   { product_third.id => 10 }],
                             location_second.id => [{ product_second.id => 5 }, { product_first.id => 30 }] })
  end

  it 'on selected date' do
    response = described_class.new(ProductsMovement.all).call(date: (Date.current - 15.days))

    expect(response).to eq({ location_second.id => [{ product_first.id => 30 }, { product_second.id => 30 }],
                             location_first.id => [{ product_first.id => 15 }, { product_second.id => 30 }] })
  end

  it 'by selected location' do
    response = described_class.new(ProductsMovement.all).call(location: location_first)

    expect(response).to eq({ location_first.id => [{ product_second.id => 10 },
                                                   { product_first.id => 15 },
                                                   { product_third.id => 10 }] })
  end
end
# rubocop:enable Metrics/BlockLength

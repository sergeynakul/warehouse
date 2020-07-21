require 'rails_helper'

RSpec.describe ProductMove do
  let(:new_products_movement) { build(:products_movement, quantity: 10) }

  it 'is supply' do
    described_class.new(new_products_movement).call(move_type: :supply)

    expect(new_products_movement.quantity).to eq 10
  end

  it 'is shipment' do
    described_class.new(new_products_movement).call(move_type: :shipment)

    expect(new_products_movement.quantity).to eq(-10)
  end
end

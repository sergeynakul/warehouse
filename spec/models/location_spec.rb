require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to have_many(:products_movements).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }
end

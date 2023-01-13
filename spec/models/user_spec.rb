require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#associations' do
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:accounts)}
  end

  describe '#user' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
  end
end

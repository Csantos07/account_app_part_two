require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:parent_account).class_name(Account.name).optional }
    it { is_expected.to have_many(:child_accounts).class_name(Account.name).dependent(:destroy)  }
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:users)}
  end

  describe '#account' do 
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:balance)}
    it { should validate_numericality_of(:balance)}
  end
end

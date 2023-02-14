require 'rails_helper'

RSpec.describe ForecastAccountTransactionService do
  describe '.calculate_forecasted_transaction_total' do
    let(:user) { build(:user) }
    let(:account) { build(:account) }
    let(:transaction) { build(:transaction, date: Date.today + 10.days, user: user, account: account) }
    let(:date_to_forecast) { Date.today + 2.months }

    it 'returns the forecast for the given account correctly' do
      expect(ForecastAccountTransactionService.calculate_forecasted_transaction_total(date_to_forecast, transaction)).to eq ([400, 2])
    end
  end
end

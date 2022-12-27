class ForecastedAccount
  attr_accessor :name, :description, :original_balance, :balance_at_forecast, :total_of_transaction, :users

  def initialize(name:, description:, original_balance:, balance_at_forecast:, users:)
    @name = name
    @description = description
    @original_balance = original_balance
    @balance_at_forecast = balance_at_forecast
    @users = []
    users.each do |user|
      @users << user
    end
  end
end
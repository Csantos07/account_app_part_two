class ForecastedTransaction
  attr_accessor :name, :date, :balance, :forecasted_total, :count

  def initialize(name:, date:, balance:, forecasted_total:, count:)
    @name = name
    @date = date
    @balance = balance
    @forecasted_total = forecasted_total
    @count =  count
  end
end
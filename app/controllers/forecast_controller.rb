# TODO
class ForecastController < ApplicationController
  def estimate
    @date_to_forecast = Date.parse(params[:date])
    @account_to_forecast = current_user.accounts.find_by(name: "Savings")
    @transaction = @account_to_forecast.transactions.find_by(name: "Mortgage")
    @transaction, @total_forcasted_balance = calculate_forecasted_transaction_total(@date_to_forecast, @transaction)
    @balance_at_forecast = @account_to_forecast.balance - @total_forcasted_balance
  end

  def calculate_forecasted_transaction_total(date_to_forecast, transaction)
    @transaction_count = 0
    months_passed = 0
    transaction_date = transaction.date
    forecasted_balance = 0

    if forecast_date_and_current_date_share_month? && 
       forecast_day_is_greater_than_or_equal_to_transaction_day? &&
       current_date_precedes_transaction_date?
       
      @transaction_count += 1
    end

    if forecast_date_is_months_away?
      months_passed = 
        (date_to_forecast.year * 12 + date_to_forecast.month) - (transaction_date.year * 12 + transaction_date.month)
      
      if !forecast_date_precedes_transaction_date?
        @transaction_count += 1
      end

      if !current_date_precedes_transaction_date?
        @transaction_count -= 1
      end
    end

    @transaction_count += months_passed

    if @transaction_count > 0
      forecasted_balance = transaction.balance * @transaction_count
    end
    
    [transaction, forecasted_balance] 
  end

  private

  def forecast_date_and_current_date_share_month?
    if @date_to_forecast.year == Date.today.year &&
       @date_to_forecast.month == Date.today.month
        return true
    end
  end

  def forecast_day_is_greater_than_or_equal_to_transaction_day?
    if @date_to_forecast.day >= @transaction.date.day
      return true
    end
  end

  def forecast_date_is_months_away?
    if (@date_to_forecast.year > Date.today.year)
       return true
    end

    if (@date_to_forecast.year == Date.today.year &&
       @date_to_forecast.month > Date.today.month)
       return true
    end
  end

  def current_date_precedes_transaction_date?
    Date.today.day < @transaction.date.day
  end

  def forecast_date_precedes_transaction_date?
    @date_to_forecast.day < @transaction.date.day
  end
end

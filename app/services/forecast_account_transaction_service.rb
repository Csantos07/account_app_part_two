# This should get the forecasted value (the total amount to add or subtract) for a specific transaction
#
# A loop willl iterate on each transaction on an account and call
# on this service object to  return how much the transaction cost should 
# subtract or add to our Forecasted Account
class ForecastAccountTransactionService
  # what does this return:
  # a single forecasted debit or credit amount that 
  # should be performed on its account for a particular date
  # ex: 
  #   ForecastAccountTransactionService.call( '11-10-30', mortgage)
  #     => should return how much should be subrtracted from the account the transaction belongs to

  # [forecasted_balance, transaction_count]
  def self.call(date_to_forecast, transaction)
    calculate_forecasted_transaction_total(date_to_forecast, transaction)
  end

  def self.calculate_forecasted_transaction_total(date_to_forecast, transaction)
    transaction_count = 0
    months_passed = 0
    transaction_date = transaction.date
    forecasted_balance = 0

    if forecast_date_and_current_date_share_month?(date_to_forecast) && 
       forecast_day_is_greater_than_or_equal_to_transaction_day?(date_to_forecast, transaction) &&
       current_date_precedes_transaction_date?(transaction)
       
      transaction_count += 1
    end

    if forecast_date_is_months_away?(date_to_forecast)
      months_passed = 
        (date_to_forecast.year * 12 + date_to_forecast.month) - (transaction_date.year * 12 + transaction_date.month)
      
      if !forecast_date_precedes_transaction_date?(date_to_forecast, transaction)
        transaction_count += 1
      end

      if !current_date_precedes_transaction_date?(transaction)
        transaction_count -= 1
      end
    end

    transaction_count += months_passed

    if transaction_count > 0
      forecasted_balance = transaction.balance * transaction_count
    end
    
    [forecasted_balance, transaction_count] 
  end

  private

  def self.forecast_date_and_current_date_share_month?(date_to_forecast)
    if date_to_forecast.year == Date.today.year &&
       date_to_forecast.month == Date.today.month
        return true
    end
  end

  def self.forecast_day_is_greater_than_or_equal_to_transaction_day?(date_to_forecast, transaction)
    if date_to_forecast.day >= transaction.date.day
      return true
    end
  end

  def self.forecast_date_is_months_away?(date_to_forecast)
    if (date_to_forecast.year > Date.today.year)
       return true
    end

    if (date_to_forecast.year == Date.today.year &&
       date_to_forecast.month > Date.today.month)
       return true
    end
  end

  def self.current_date_precedes_transaction_date?(transaction)
    Date.today.day < transaction.date.day
  end

  def self.forecast_date_precedes_transaction_date?(date_to_forecast, transaction)
    date_to_forecast.day < transaction.date.day
  end
end
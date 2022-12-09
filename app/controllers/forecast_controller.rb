# TODO
class ForecastController < ApplicationController
  def estimate
    @date_to_forecast = Date.parse(params[:date])

    @account_to_forecast = current_user.accounts.find_by(name: "Savings")
    @transaction = @account_to_forecast.transactions.first
    @total_forcast_expenses = calculate_total_expenses(@date_to_forecast, @transaction)
    @balance_at_forecast = @account_to_forecast.balance - @total_forcast_expenses

    # should return something like all the updated transactions or just a single updated transaction
    # we will do a batch version
  end

  def calculate_total_expenses(date_to_forecast, transaction)
    date_to_forecast = date_to_forecast
    distance_between_dates = nil
    years_passed = nil
    months_passed = nil
    transaction_date = transaction.date

    if date_to_forecast.year >= transaction_date.year
      distance_between_dates = date_to_forecast - transaction_date
      years_passed = (distance_between_dates.to_i) / 365
        months_passed = (date_to_forecast.year * 12 + date_to_forecast.month) - (transaction_date.year * 12 + transaction_date.month)
        months_passed += 1
        unless date_to_forecast.day <= transaction_date.day
          months_passed -= 1
        end
    end
    byebug
    if months_passed != nil && months_passed != 0
      times_to_run_transaction = months_passed
    end
    if times_to_run_transaction > 0
      transaction.balance * times_to_run_transaction
    else
      0
    end
  end
end

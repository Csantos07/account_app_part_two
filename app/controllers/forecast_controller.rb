# TODO
require 'ostruct'

class ForecastController < ApplicationController
  def estimate
    @accounts = []
    @date_to_forecast = Date.parse(params[:date])
    @accounts_to_forecast = current_user.accounts.where(name: "Savings")
    @transactions = @accounts_to_forecast[0].transactions
    @transaction = @transactions[0]
    @total_forcasted_balance, @transaction_count = 
      ForecastAccountTransactionService.call(@date_to_forecast, @transaction)

    @balance_at_forecast = @accounts_to_forecast[0].balance - @total_forcasted_balance
    
    forecasted_account = OpenStruct.new
    forecasted_account.name = @accounts_to_forecast[0].name
    forecasted_account.description = @accounts_to_forecast[0].description
    forecasted_account.balance = @balance_at_forecast
    forecasted_account.users = []
    @accounts_to_forecast[0].users.each do |user|
      forecasted_account.users << user
    end

    @accounts << forecasted_account

    # This code is simply here to put some other accounts on the views
    current_user.accounts.each do |account|
      if account.name != "Savings"
        @accounts << account
      end
    end

    render 'accounts/index'
  end

   def deprecated_estimate
    @date_to_forecast = Date.parse(params[:date])
    @account_to_forecast = current_user.accounts.find_by(name: "Savings")
    @transaction = @account_to_forecast.transactions.find_by(name: "Mortgage")
    @total_forcasted_balance, @transaction_count = 
      CalculateForecast.call(@date_to_forecast, @transaction)

    @balance_at_forecast = @account_to_forecast.balance - @total_forcasted_balance
  end

  # What I should be displaying is a list of 
  # accounts with their updated balance
end

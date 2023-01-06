# TODO
require 'ostruct'

class ForecastsController < ApplicationController
  # This should return an estimate for all accounts
  def index
    @forecast_date = Date.parse(params[:date])
    @accounts_to_forecast = current_user.accounts
    @accounts = []
    forecasted_account = nil
    
    @accounts_to_forecast.each do |account|
      transactions = account.transactions
      @account_balance = account.balance
      @forecasted_transactions = []
      balance_at_forecast = account.balance

      transactions.each do |transaction|

        @forecasted_total_of_transaction, @transaction_count = 
          ForecastAccountTransactionService.call(@forecast_date, transaction)
      
        balance_at_forecast = 
          (balance_at_forecast || account_balance) - @forecasted_total_of_transaction

        forecasted_transaction = ForecastedTransaction.new(
          name: transaction.name,
          date: transaction.date,
          balance: transaction.balance,
          forecasted_total: @forecasted_total_of_transaction,
          count: @transaction_count
        )

        @forecasted_transactions << forecasted_transaction
      end

      forecasted_account = ForecastedAccount.new(
        name: account.name,
        description: account.description,
        original_balance: account.balance,
        balance_at_forecast: balance_at_forecast,
        users: account.users
      )

      forecasted_account.transactions = @forecasted_transactions
      @accounts << forecasted_account
    end
  end
  
  # def estimate
  # end
  # What I should be displaying is a list of 
  # accounts with their updated balance
end

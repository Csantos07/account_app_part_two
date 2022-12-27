# TODO
require 'ostruct'

class ForecastController < ApplicationController
  # This should return an estimate for all accounts
  def estimate
    @accounts = []
    @forecast_date = Date.parse(params[:date])
    @accounts_to_forecast = current_user.accounts.where(name: "Savings")
    @account_balance = @accounts_to_forecast[0].balance # this may not need to be an instance var
                                                        # should just be tagged on to forecasted_account
    @transactions = @accounts_to_forecast[0].transactions
    @forecasted_transactions = []
    @transactions.each do |transaction|

      @forecasted_total_of_transaction, @transaction_count = 
        ForecastAccountTransactionService.call(@forecast_date, transaction)
    
      @balance_at_forecast = 
        (@balance_at_forecast || @account_balance) - @forecasted_total_of_transaction
     
      forecasted_account = OpenStruct.new
      forecasted_account.name = @accounts_to_forecast[0].name
      forecasted_account.description = @accounts_to_forecast[0].description
      forecasted_account.balance = @balance_at_forecast
      forecasted_account.users = []
      forecasted_account.total_of_transaction = @forecatsted_total_of_transaction
      @accounts_to_forecast[0].users.each do |user|
        forecasted_account.users << user
      end

      forecasted_transaction = OpenStruct.new
      forecasted_transaction.name = transaction.name
      forecasted_transaction.date = transaction.date
      forecasted_transaction.balance = transaction.balance
      forecasted_transaction.forecasted_total = @forecasted_total_of_transaction
      forecasted_transaction.count = @transaction_count

      @forecasted_transactions << forecasted_transaction
    end
    # @accounts << forecasted_accounts

    # This code is simply here to put some other accounts on the views
    # current_user.accounts.each do |account|
    #   if account.name != "Savings"
    #     @accounts << account
    #   end
    # end

    # render 'accounts/index'
  end

  # def deprecated_estimate
  #   @date_to_forecast = Date.parse(params[:date])
  #   @account_to_forecast = current_user.accounts.find_by(name: "Savings")
  #   @transaction = @account_to_forecast.transactions.find_by(name: "Mortgage")
  #   @forecasted_total_of_transaction, @transaction_count = 
  #     CalculateForecast.call(@date_to_forecast, @transaction)

  #   @balance_at_forecast = @account_to_forecast.balance - @forecasted_total_of_transaction
  # end

  # What I should be displaying is a list of 
  # accounts with their updated balance
end

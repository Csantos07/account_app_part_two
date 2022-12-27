# TODO
require 'ostruct'

class ForecastController < ApplicationController
  # This should return an estimate for all accounts
  def estimate
    @forecast_date = Date.parse(params[:date])
    @accounts_to_forecast = current_user.accounts.where(name: "Savings")
    @account_balance = @accounts_to_forecast[0].balance # this may not need to be an instance var
                                                        # should just be tagged on to forecasted_account
    @transactions = @accounts_to_forecast[0].transactions
    @accounts = []
    @forecasted_transactions = []
    @transactions.each do |transaction|

      @forecasted_total_of_transaction, @transaction_count = 
        ForecastAccountTransactionService.call(@forecast_date, transaction)
    
      @balance_at_forecast = 
        (@balance_at_forecast || @account_balance) - @forecasted_total_of_transaction

      forecasted_account = ForecastedAccount.new(
        name: @accounts_to_forecast[0].name,
        description: @accounts_to_forecast[0].description,
        original_balance: @accounts_to_forecast[0].balance,
        balance_at_forecast: @balance_at_forecast,
        users: @accounts_to_forecast[0].users
      )

      forecasted_transaction = ForecastedTransaction.new(
        name: transaction.name,
        date: transaction.date,
        balance: transaction.balance,
        forecasted_total: @forecasted_total_of_transaction,
        count: @transaction_count
      )

      @accounts << forecasted_account
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
  # What I should be displaying is a list of 
  # accounts with their updated balance
end

class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    # @portfolio_item = Portfolio.find(params[:id])
    @account = Account.find(params[:id])
  end

  def destroy
    Account.destroy(params[:id])
  end
end
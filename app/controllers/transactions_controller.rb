class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.create!(transaction_params)
    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :description, :balance, :user_id, :account_id)
  end
end
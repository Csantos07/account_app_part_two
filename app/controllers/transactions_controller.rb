class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = Transaction.new
  end

  # TODO
  def create
    @transaction = current_user.transactions.new(transaction_params)
    year = transaction_params["date(1i)"].to_i
    month = transaction_params["date(2i)"].to_i
    day = transaction_params["date(3i)"].to_i

    date = Date.parse("#{year}-#{month}-#{day}")
    @transaction.date = date
    @transaction.save!

    redirect_to transactions_path
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
  end

  def destroy
    Transaction.destroy(params[:id])

    redirect_to transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :date, :balance, :user_id, :account_id)
  end
end
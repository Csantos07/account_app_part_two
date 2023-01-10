class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update, :show]

  def index
    @accounts = current_user.accounts
  end

  def show
    @child_accounts = @account.child_accounts
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = current_user.accounts.create(account_params)
    @account.users << current_user # this should eventually be redundant
    @account.save                   # once we have has many through

    if @account.errors.any?
      # drawback of this is when I refresh
      # we redirect to the index
      render :new      
    else      
      redirect_to accounts_path
    end
  end

  def update
    @account.update(account_params)

    redirect_to accounts_path
  end

  def destroy
    Account.destroy(params[:id])

    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:name, :description, :balance, :parent_account_id, :user_id)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
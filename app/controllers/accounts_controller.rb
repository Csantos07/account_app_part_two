class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    @child_accounts = @account.child_accounts
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    Account.create(
      name: params[:account][:name], 
      description: params[:account][:description],
      balance: params[:account][:balance]
    )
    
    redirect_to action: "index"
  end

  def update
    @account = Account.find(params[:id])
    @account.update(
      name: params[:account][:name], 
      description: params[:account][:description],
      balance: params[:account][:balance]
    )

    redirect_to action: "index"
  end

  def destroy
    Account.destroy(params[:id])

    redirect_to action: "index"
  end
end
class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = current_user.accounts.all
  end

  def show
    @account = Account.find(params[:id])
    @child_accounts = @account.child_accounts
  end

  def new
    @account = Account.new
    parent_accounts = Account.all
    @parent_accounts = [['No Parent', nil]]

    parent_accounts.each do |account|
      @parent_accounts << [account.name, account.id]
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    if params[:account][:parent_account].present?
      parent_account = Account.find(params[:account][:parent_account])
    end

    Account.create(
      name: params[:account][:name], 
      description: params[:account][:description],
      balance: params[:account][:balance],
      parent_account: parent_account,
      users: [current_user]
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
class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = current_user.accounts
  end

  def show
    @account = Account.find(params[:id])
    @child_accounts = @account.child_accounts
  end

  def new
    @account = Account.new
    parent_accounts = Account.all

    # TODO
    # move to a <accounts_helper class="rb"># use in view html erb file</accounts_helper>
    @parent_accounts = [['No Parent', nil]]

    parent_accounts.each do |account|
      @parent_accounts << [account.name, account.id]
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = current_user.accounts.create(acccount_params)

    if @account.errors.any?
      # drawback of this is when I refresh
      # we redirect to the index
      render :new
    else
      redirect_to accounts_path
    end
  end

  def update
    @account = Account.find(params[:id])
    @account.update(
      name: params[:account][:name], 
      description: params[:account][:description],
      balance: params[:account][:balance]
    )

    redirect_to accounts_path
  end

  def destroy
    Account.destroy(params[:id])

    redirect_to accounts_path
  end

  private

  def acccount_params
    params.require(:account).permit(:name, :description, :balance, :parent_account_id, :user_id)
  end
end
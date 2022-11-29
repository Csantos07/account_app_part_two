module AccountHelper
  def display_parent_accounts(form_object)
    parent_accounts = Account.all
    @parent_accounts = [['No Parent', nil]]
    @form_object = form_object

    parent_accounts.each do |account|
      @parent_accounts << [account.name, account.id]
    end

    if @parent_accounts
      render inline: "<div><%= @form_object.select :parent_account_id, @parent_accounts, placeholder: 'Parent Account' %><br><br></div>"
    end
  end
end
class AddHabtmForUsersAndAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts_users, id: false do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :account, type: :uuid
    end
  end
end

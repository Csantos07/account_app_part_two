class AddHabtmForUsersAndAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts_users, id: false do |t|
      t.belongs_to :user, type: :uuid, references: :users, foreign_key: { to_table: :users }
      t.belongs_to :account, type: :uuid, references: :account, foreign_key: { to_table: :accounts }
    end
  end
end

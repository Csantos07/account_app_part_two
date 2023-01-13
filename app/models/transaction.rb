class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  validates :name, :balance, :date, :account, presence: true

  # In rails c
  # Transaction.create!(balance: 100, name: 'test', user_id: user_id, account_id: account_id)
end

# TODO
# Possibly create a new model for future transactions
# upcoming, canceled/postponed, completed, (enum)
# type: income, expense


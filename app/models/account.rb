class Account < ApplicationRecord
  has_many :accounts_users
  has_many :users, through: :accounts_users
  belongs_to :parent_account, class_name: 'Account', optional: true
  has_many :child_accounts, class_name: 'Account', foreign_key: 'parent_account_id', dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :name, :description, :balance, presence: true
  validates :balance, numericality: true, allow_nil: true
  validate :at_least_one_user
  
  def at_least_one_user
     errors.add(:users, "There must be at least one user assigned to the account") if users.empty?
  end
end

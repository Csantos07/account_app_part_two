class Account < ApplicationRecord
  belongs_to :parent_account, class_name: 'Account', optional: true
  has_many :child_accounts, class_name: 'Account', foreign_key: 'parent_account_id', dependent: :destroy
  has_and_belongs_to_many :users
end

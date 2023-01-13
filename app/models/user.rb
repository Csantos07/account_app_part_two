class User < ApplicationRecord
  has_many :accounts_users
  has_many :accounts, through: :accounts_users
  has_many :transactions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO
  # add validation, email, unique, presence etc.
end

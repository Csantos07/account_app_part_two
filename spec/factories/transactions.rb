# This will guess the User class
FactoryBot.define do
  factory :transaction do
    balance { 200 }
    name { "test" }
    date { Date.today - 5 }
    user
    account
  end
end

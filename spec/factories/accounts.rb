# This will guess the User class
FactoryBot.define do
  factory :account, class: Account do
    name { "Savings" }
    description { "Dummy text "}
    balance { 200_000 }
    # parent_account

    transient do
      users_count { 1 }
    end

    after(:create) do |account, evaluator|
      create_list(:user, evaluator.users_count, users: [user])
    end
  end

  factory :parent_account, class: Account do
    name { "Savings" }
    balance { 200_000 }    
    description { "Dummy text "}

    transient do
      users_count { 1 }
    end

    after(:create) do |account, evaluator|
      create_list(:user, evaluator.users_count, users: [user])
    end
  end

end



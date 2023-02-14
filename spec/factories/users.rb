# This will guess the User class
FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "test#{n}@example.com"}
    password { "test1234" }
    password_confirmation { "test1234" }
    # accounts { build(:account) }
    
  end

  factory :dummy_user, class: User do
    sequence :email do |n|
      "dummy2Email#{n}@gmail.com"
    end
    password { "test1234" }
    password_confirmation { "test1234" }
  end
end

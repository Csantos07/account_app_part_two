# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create at least one user
user_one = User.create!(email: "antcs07@gmail.com", password: "password")
user_two = User.create!(email: "antcs08@gmail.com", password: "password")


# Account.create!(name: "first account", balance: 210000.00, user_id: user_two.id)
# Account.create!(name: "second account", balance: 210000.00, user_id: user_two.id)

account_one = Account.create!(name: "first account", balance: 210000.00)
account_two = Account.create!(name: "second account", balance: 210000.00)

user_one.accounts << [account_one, account_two]
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy Alll Users
User.destroy_all
Account.destroy_all
Transaction.destroy_all

# ----------------------------------------------------------------
# Create Two Users
user_one = User.create!(email: "antcs07@gmail.com", password: "password")
user_two = User.create!(email: "antcs08@gmail.com", password: "password")

# Create accounts and assign users
savings = user_one.accounts.new(name: "Savings", description: "All Personal Savings", balance: 22_793.43)
joint_saving = user_one.accounts.new(name: "Joint Savings", description: "Savings Between my spouse and I", balance: 100091.00)
checking = user_one.accounts.new(name: "Checking", description: "Personal Checking", balance: 605.79)
joint_checking = user_one.accounts.new(name: "Joint Checking", description: "Personal Checking", balance: 517.59)

savings.users << user_one
joint_saving.users << user_one
joint_saving.users << user_two
checking.users << user_one
joint_checking.users << user_one
joint_checking.users << user_two

# Save changes made to accounts (ie: assigning users)
savings.save
joint_saving.save
checking.save
joint_checking.save
# ----------------------------------------------------------------
# Create Transactions
# Transaction.create!(balance: 1400, name: 'Mortgage', user_id: user_one.id, account_id: savings.id, date: Date.today.beginning_of_month)
Transaction.create!(balance: 711, name: 'Bills', user_id: user_one.id, account_id: savings.id, date: Date.parse("2022-12-7"))
Transaction.create!(balance: 801, name: 'Mortgage', user_id: user_one.id, account_id: savings.id, date: Date.parse("2022-12-22"))
# date = Date.parse("#{year}-#{month}-#{day}")
Transaction.create!(balance: 400, name: 'Trip To Barbados', user_id: user_one.id, account_id: savings.id, date: Date.today.beginning_of_month)

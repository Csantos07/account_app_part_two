# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create at least one user
User.destroy_all
Account.destroy_all

user_one = User.create!(email: "antcs07@gmail.com", password: "password")
user_two = User.create!(email: "antcs08@gmail.com", password: "password")

savings = user_one.accounts.new(name: "Savings", description: "All Personal Savings", balance: 25005.38)
joint_saving = user_one.accounts.new(name: "Joint Savings", description: "Savings Between my spouse and I", balance: 100091.00)
checking = user_one.accounts.new(name: "Checking", description: "Personal Checking", balance: 605.79)
joint_checking = user_one.accounts.new(name: "Joint Checking", description: "Personal Checking", balance: 517.59)

savings.users << user_one
joint_saving.users << user_one
joint_saving.users << user_two
checking.users << user_one
joint_checking.users << user_one
joint_checking.users << user_two

savings.save
joint_saving.save
checking.save
joint_checking.save

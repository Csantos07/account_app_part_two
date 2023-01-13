# README

This README would normally document whatever steps are necessary to get the
application up and running.

Currently all that is need to run this app is Ruby, Rails, and Postgres

Things you may want to cover:

* Ruby version: ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-darwin20]

* Rails Version: Rails 6.1.7

* System dependencies:

* Configuration

* Database creation - Postgres

* Database initialization - Run the seeds file

* How to run the test suite
- Planning on using rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
- Will be deployed using heroku or amazon

## Staging Branch

This branch will serve as a place to merge large commit's before merging to main.

Impetus: 
- I've strayed away from main without making any PR's or Merges.
- I want a way to review code without it being so permanent.
- I want the first PR to be as easy to review as possible.

---
## crud-transaction-madel-and-views-rakib_1-9-23

### 1.12.23
### In this commit [(source)](https://github.com/Csantos07/account_app_part_two/commit/cf7d5a0999fb9487a7f85af4c3b707733da65455)
- Install factory_bot & shoulda_matchers
- Consider the refresh issue when on the new accounts form
- Created a new model called accounts_user that serves as our join model
- Added validation to transaction. Still needs to be seen in the view.
- Added tests for user and account

### 1.9.23

### Finished Session [(source)](https://github.com/Csantos07/account_app_part_two/commit/f3709ff19ff04682526b60d049d4bad8d38e7830)
- Installed rspec and configured
- Talked about the rendundance of current_user creating an account & then being assigned to that account. [(source)](https://github.com/Csantos07/account_app_part_two/commit/f3709ff19ff04682526b60d049d4bad8d38e7830#diff-25fe163085ea55de795324d01f141d5e4de00c6a2d3035d75c6e0768af679a2eR22)
- Use of collection_select to for our dropdown option, where there is no parent account on our account being created.
  - This should allow us to eliminate our helper

### In this session:
- My goal is to quickly summarize the code review. 
- Talk about refactoring the `forecast_account_transaction_service`
- Get into testing the service as well as controllers and models


## crud-transaction-model-and-views

### 1.5.23

#### In this commit: 
- We are able to forecast on multiple transactions as well as multiple accounts.
- Updated `forecast_controller` to `forecasts_controller`.
- Added an array of `transactions` to the `ForecastedAccount` model.
- Created a Partial for estimate view. (may want to rename the view)
- New methods: 
  - `current_date_precedes_transaction_day?`
  - `transaction_is_within_forecast?`

#### Next Steps:
  - [ ] Create clarity in forecast_account_transaction_service logic
    - [ ] Create tests to refactor with confidence.
  - [ ] Clean the forecasts_controller.
    - [ ] Remove uncecessary instance variablles.
---
12.27.22 Part 2
At this point we have the forecast functionality hardcoded for 

  - one account: Savings
  - many transactions: Mortgage, Bills, Rakib, and Trip to Barbados

Todo:

- [x] Create a couple of other transactions under savings.
  - [x] Make sure all transactions are performed as expected.
- [x] Create transactions on a seperate account.
  - [x] Checking: Gym Membership or Credit Card
- [x] Create a view for forecast
  - [x] Should display all accounts with forecasted balance and previous info
  - [x] Create a temporary memory object that representst the new forecasted       
    account
    - [x] A class or an ostruct

In this commit: 
We created two new models: ForecastedAccount & ForecastedTransaction

---
12.27.22 
At this point we have the forecast functionality hardcoded for 

one account: Savings
many transactions: Mortgage & Bills

Todo:

- [x] Create a couple of other transactions under savings.
  - [x] Make sure all transactions are performed as expected.
- Create transactions on a seperate account.
  - Checking: Gym Membership or Credit Card
- Create a view for forecast
  - Should display all accounts with forecasted balance and previous info
  - Create a temporary memory object that representst the new forecasted       
    account
    - A class or an ostruct

In this commit: 
We are forecasting an account with many transactions.

---
12.16.22 
At this point we have the forecast functionality hardcoded for 

one account: Savings
one transaction: Mortgage

Todo:
- Create a couple of other transactions under savings.
  - Make sure all transactions are performed as expected.
- Create transactions on a seperate account.
  - Checking: Gym Membership or Credit Card
- Create a view for forecast
  - Should display all accounts with forecasted balance and previous info
  - Create a temporary memory object that representst the new forecasted       
    account
    - A class or an ostruct
---
What I want to do with this PR is to get a simple rudimentary version of forecast working.

We got a simple version working with one account.
Definitely want to check the logic on when to process the transaction on the month.

---

Applying bootstrap styles to account cards.
`sandbox` -> `address-rakib-comment-01-transaction-model-bootstrap-and-css`

---

This can be merged into account-model-hbtm_no_extra_model-self-relationhip-exp.

- [ ] rename accounts_users to accounts_user
  - This actually looks to be the convention according to:
    https://stackoverflow.com/questions/11590469/rails-naming-convention-for-join-table
- [x] make validations
- [x] reinforce strong params on update
- [x] before action on setting account
- [x] make a helper to display a list of parents
- [ ] finish transaction model

---

Validations made for account

- :name, :description, :balance, presence: true
- :balance, numericality: true
- :users, at_least_one_user

Validations for user is handled by devise

---

Strip Whitelisted strong params. Lets do this for update as well.

---

Display Errors for accounts

---

Custom Validation to check that their is at least one user assigned to account.

---

Updated seeds. (they broke after creating the validations. code seems verbose. would like to refactor)

---

Transaction Migration and Model Created.

- [ ] Create views for transactions
- [ ] Follow the figma for how transaction and form should look for accounts

---

Create a branch to play with bootstrap and style.
`address-rakib-comment-01-transaction-model` ->
`address-rakib-comment-01-transaction-model-bootstrap-&-css`

---


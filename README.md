# README

This can be merged into account-model-hbtm_no_extra_model-self-relationhip-exp.

- [ ] rename accounts_users to accounts_user
  - This actually looks to be the convention according to:
    https://stackoverflow.com/questions/11590469/rails-naming-convention-for-join-table
- [x] make validations
- [x] reinforce strong params on update
- [x] before action on setting account
- [ ] make a helper to display a list of parents
- [ ] finish transaction model

---

Validations made for account

- :name, :description, :balance, presence: true
- :balance, numericality: true

Validations for user is handled by devise

---

Strip Whitelisted strong params. Lets do this for update as well.

---

Display Errors for accounts

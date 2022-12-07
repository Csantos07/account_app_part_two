# README

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

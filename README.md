# README

I am creating this branch trying to create an account model.
I want to try using the generator to make a has and belongs to many
relationship.

I'll start with the has_and_belongs_to_many_approach as opposed
to the has_many :through

The Generator I ran.

` rails g model Account user:references name description:text balance:decimal`

---

create-account-model-with-references

Created a migration for account.
Has and belongs to relationship

First implementation but no has and belongs to many relationship. Just a has and belongs to relationship.

PR: https://github.com/Csantos07/account_app_part_two/pull/4

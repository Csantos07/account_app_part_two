# README

-------------------------------------------------------------
This approach is the has and belongs to many approach which is working.

Just finished crud for accounts.
My next step is to create a relationship between Accounts and child accounts.

Things I would like to fix. Tech Debt: I feel as though I am specifiyng the method to helper paths more than I need to.
-------------------------------------------------------------
I am creating this branch trying to create an account model. 
I want to try using the generator to make a has and belongs to many
relationship.

I'll start with the has_and_belongs_to_many_approach as opposed 
to the has_many :through

The Generator I ran.

``` rails g model Account user:references name description:text balance:decimal```

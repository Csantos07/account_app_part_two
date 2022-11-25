# README

I am creating this branch trying to create an account model. 
I want to try using the generator to make a has and belongs to many
relationship.

I'll start with the has_and_belongs_to_many_approach as opposed 
to the has_many :through

The Generator I ran.

``` rails g model Account user:references name description:text balance:decimal```

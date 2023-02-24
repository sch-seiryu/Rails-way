# Rails-way
Practicing 'Ruby on Rails' with a given simple assignment.

## FURTHER NOTICE
* To read dev notes, see 'RailsTest_Note.md' in 'dev1' branch; it contains TMI.

## Current State
* Project has been initialized through *Ruby on Rails*
    * confirmed its server is working over *Puma* on 'localhost:3000'
* [InProgress] Route paths and generate controllers
* [Next] Make records/models/entities and migrate DB


## Model
* Generate User and Content models via console (Windows); it seems there's no specific field type for an email neither password, simply use 'string' type for those fields.
> ruby bin/rails generate model User firstName:string lastName:string email:string password:string country:string
> ruby bin/rails generate model Content title:string body:text user:references
* Also, following commands had been used to make controllers.
> ruby bin/rails generate controller Users sign_up sign_in --skip-routes
> ruby bin/rails generate controller Contents create get update delete --skip-routes

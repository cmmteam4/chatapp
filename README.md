# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Heroku deploy step
    -heroku login -i
    -heroku apps:create team5chatapp
    -heroku git:remote -a team5chatapp
    -git push heroku master
    -heroku pg:info
    -heroku addons:create heroku-postgresql
    -heroku pg:info
    -heroku config --app team5chatapp
    -heroku run rails db:migrate
   




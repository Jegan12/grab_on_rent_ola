# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Clone the app

* Change the .env file for database & redis configuration

* Run rails db:create db:migrate db:seed

* In env change APPLICATION  as any one of [ADMIN,CUSTOMER,DRIVER].

* run bundle exec sidekiq 3 to start the sidekiq

* Run the app 3 times with APPLICATION env as ADMIN , CUSTOMER, DRIVER with same database and redis conf



# README

* Ruby version 3.3.3

* Configuration

````
rvm install 3.3.3
gem install rails -v '7.1.3.4'
````

* Database creation && initialization && seeds
````
bundle exec rake db:create db:migrate db:seed
````

* How to run the test suite
````
bundle exec rspec spec
````


Request to 

Endpoint jobs
````
curl -X GET http://localhost:3000/api/v1/jobs
````

Endpoint applications
````
curl -X GET http://localhost:3000/api/v1/applications
````

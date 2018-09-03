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
  bundle exec rspec


##### Redis

Start redis with

$ redis-server /usr/local/etc/redis.conf


##### Generate doc

$ rake docs:generate
$ open doc/api/index.html

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


##### Check quality and maintenance of code


The following task will run differents tools for checking quality, maintenance, and security in this code.


```sh
  rake code:check
```


You can also run this tools manually


```sh
  rubucop .
```


```sh
  rails_best_practices .
```


```sh
  brakeman .
```


And so on..

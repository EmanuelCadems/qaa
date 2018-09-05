# README

This is an API about Questions and Answers. You can find the full description inside specs

## Ruby version


2.5.1
Are you using rvm?
run:
```bash
  $ cd .
```
This will select the ruby version and will also create a gemset called qaa.

## System dependencies
  Postgresql 9.4

## Configuration


Install bundler with:
```bash
  $ gem install bundler -v='1.16.4' --no-rdoc --no-ri
```
Then install all dependencies with
```bash
  $ bundle install
```

Create your `config/application.yml` and fill it with the required environment variables.
```bash
  $ cp config/application.yml.example config/application.yml
```

## Database creation
```bash
  $ rake db:create
```

## Database initialization
```bash
  $ rake db:migrate
```

## Populates the DB
```bash
  $ rake db:seed
```

## How to run the test suite
This project use rspec. You can run the tests with:
```bash
  $ bundle exec rspec
```
You can see the coverage with:
```bash
  $ open coverage/index.html
```

## Redis

Start redis with

$ redis-server /usr/local/etc/redis.conf


## Extra feature Backup Redis

You can persist Redis from Memmory to Database running the following task:

$ rake redis:persist

You can set a cron job to run all days with this task just in case you lost redis data.

You can recover the persisted data back to redis with:

$ rake redis:recover

Be carefull with this last task because you are going to override your redis data with the backup.


## Generate doc

$ rake docs:generate
$ open doc/api/index.html

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Check quality and maintenance of code


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


## Deploy

Upload environment variables to heroku with:

```bash
  $ figaro heroku:set -e production
```

Check environment variables with

```bash
  $ heroku config
```

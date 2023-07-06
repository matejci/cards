# README

Task link: https://keen-nurse-d0d.notion.site/RoR-Test-4ed53b60c0864563922ee572f5dadb5e

* Ruby version: 3.1.0

* Rails version: 7.0.5

* Postgres 15

* Redis 7

Setting up locally:
- make sure Postgres server is up and running
- make sure Redis server is up and running
- rails db:create
- rails db:migrate
- rails s  (or bundle exec puma -C config/puma.rb)
- sidekiq -C config/sidekiq.yml

Docker:
- install docker and docker-compose
- docker-compose build
- docker-compose up

Rake tasks to run:
- `rails graded_cards:inserts_using_sidekiq`
- `rails graded_cards:inserts_using_threads`

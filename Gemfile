# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.5", ">= 7.0.5.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

# gem "jbuilder"

gem "redis", "~> 4.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'sidekiq'


group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'faker'
end


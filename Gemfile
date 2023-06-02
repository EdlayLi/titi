# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.1.3"
gem "devise"
gem "dockerfile-rails", ">= 1.2", group: :development
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem "importmap-rails"
gem "jbuilder"
gem "nokogiri", "1.14.3"
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "rails-i18n", "~> 7.0.0"
gem "redis", "~> 5.0"
gem "rubocop-rails", require: false
gem "sendgrid-ruby"
gem "slim"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "bundler", "2.4.12"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "letter_opener"
  gem "pry-rails"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

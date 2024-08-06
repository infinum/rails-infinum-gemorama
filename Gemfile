# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

gem 'bootsnap', require: false
gem 'bugsnag'
gem 'figaro'
gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'pry-byebug'
gem 'pry-rails'
gem 'puma', '>= 5.0'
gem 'slim'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'strong_migrations'
gem 'turbo-rails'

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'rubocop-infinum', require: false
  gem 'slim_lint', require: false
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'overcommit', require: false

  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'rspec-rails'
end

group :deploy do
  gem 'mina-infinum', require: false
end

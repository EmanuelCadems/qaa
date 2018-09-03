source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'raddocs', '2.2.0'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making
# cross-origin AJAX possible
gem 'rack-cors', '1.0.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'brakeman', '4.3.1', require: false
  gem 'bullet', '5.7.6'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '4.11.0'
  gem 'guard-rspec', '4.7.3', require: false
  gem 'rails_best_practices', '1.19.3'
  gem 'rspec-rails', '3.8.0'
  gem 'rspec_api_documentation', '5.1.0'
  gem 'rubocop', '0.58.2', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'database_cleaner', '1.7.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'shoulda-matchers', '3.1.2'
  gem 'simplecov', '0.16.1', require: false
end

gem 'api-pagination', '4.8.1'
gem 'faker', '1.9.1'
gem 'fast_jsonapi', '1.3'
gem 'figaro', '1.1.1'
gem 'rack-attack', '5.4.0'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'redis', '4.0.2'
# gem 'rorvswild', '1.4.1'
gem 'will_paginate', '3.1.6'
# gem 'bundler-audit'

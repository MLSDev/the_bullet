source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'
gem 'puma'

# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

gem 'rack-cors', require: 'rack/cors'
gem 'kaminari'
gem 'dotenv-rails'
gem 'draper', '~> 3.0.0.pre1'
gem 'pundit'
gem 'sidekiq'
# gem 'rpush

group :production do
  gem 'lograge'
  gem 'exception_notification'
  gem 'rack-timeout'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'awesome_print', require: 'ap'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # rubocop version locked due config. Update rubocop config on gem update.
  gem 'rubocop', '0.45.0', require: false
  gem 'capistrano'
  gem 'capistrano-rails'
  # gem 'bullet'
  # gem 'lol_dba'
  # gem 'brakeman'
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'shoulda-callback-matchers'
  gem 'simplecov', require: false
end

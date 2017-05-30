source 'https://rubygems.org'

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'bcrypt'
gem 'redis'
gem 'redis-objects'
gem 'rack-cors', require: 'rack/cors'
gem 'kaminari'
gem 'dotenv-rails'
gem 'draper'
gem 'pundit'
gem 'sidekiq'
gem 'rpush'
gem 'paperclip'
gem 'paperclip-meta'
gem 'swagger-blocks'

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
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'bundler-audit'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # rubocop version locked due config. Update rubocop config on gem update.
  gem 'rubocop', '0.49.1', require: false
  gem 'mry'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'bcrypt_pbkdf' # for rbnacl-libsodium
  gem 'rbnacl', '< 4.0' # for rbnacl-libsodium
  gem 'rbnacl-libsodium' # for ssh-ed25519 support
  # gem 'bullet'
  # gem 'lol_dba'
  gem 'brakeman'
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'shoulda-callback-matchers'
  gem 'simplecov', require: false
  gem 'database_rewinder'
end

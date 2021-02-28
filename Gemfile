source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.0.3'

gem 'aws-sdk-ssm'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'jbuilder'
gem 'lamby', require: false
gem 'webpacker'
gem 'sass-rails'
gem 'nanoid'
gem 'aws-record', '~> 2.0' # https://github.com/aws/aws-sdk-ruby-record


group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'lograge'
end

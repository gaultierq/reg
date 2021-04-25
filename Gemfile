source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0.rc1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
# gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'ffaker'
gem 'mini_magick', '~> 4.8'
gem 'rails-i18n', '~> 5.1'
gem 'browser'
gem 'select2-rails'
gem 'jquery-rails'
gem 'deep_cloneable', '~> 2.3.2'
gem 'two_factor_authentication'
gem 'figaro'
gem 'geokit'
gem 'geokit-rails'
gem 'activestorage-openstack', '1.0'

group :production do
  gem 'aws-sdk-s3', require: false
  gem 'pg'
end

group :development, :test do
  gem 'bullet' #help to kill N+1 queries and unused eager loading
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] #like degugger;
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'sqlite3'
  gem 'meta_request'
end

group :development do
  # gem 'bundler-audit', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'dotenv-rails', groups: [:development, :test]

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


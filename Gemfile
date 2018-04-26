source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.0.rc1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'mini_racer', platforms: :ruby
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'rails-i18n', '~> 5.1'
gem 'ffaker'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'bullet'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'bundler-audit', require: false
  gem 'rails-erd'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

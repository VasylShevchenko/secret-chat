source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'

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

gem 'colorize', '~> 0.8.1'

# A Ruby framework for rapid API development with great conventions.
gem 'grape', '~> 1.2', '>= 1.2.4'
gem 'grape-jbuilder', '~> 0.2.0'
gem 'hashie', '~> 3.6'
gem 'grape-swagger', '~> 0.32.1'
gem 'grape-swagger-ui', '~> 2.2', '>= 2.2.8'
gem 'rack-cors', '~> 1.0', '>= 1.0.3'

gem 'devise', '~> 4.7'
gem 'interactor', '~> 3.1', '>= 3.1.1'
gem 'pundit', '~> 2.0', '>= 2.0.1'

# gem 'sidekiq', '~> 5.2', '>= 5.2.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 3.8'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'awesome_print'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

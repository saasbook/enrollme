source 'https://rubygems.org'


gem 'rails', '4.2.6'

gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'haml'

gem "omniauth-google-oauth2", "~> 0.2.1"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'capistrano'

group :test do
  gem 'simplecov', :require => false
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'autotest-rails'
  gem 'factory_girl_rails' # if using FactoryGirl
  gem 'metric_fu'        # collect code metrics
  gem 'codeclimate-test-reporter', '0.6.0', require: nil
  gem 'capybara-screenshot'
end

group :development, :test do
  gem 'sqlite3' # Use sqlite3 as the database for Active Record
  gem 'byebug'
  gem 'jasmine-rails' # if you plan to use JavaScript/CoffeeScript
  gem 'database_cleaner', '1.4.1' # required by Cucumber
  gem 'capybara', '2.10.0'
  gem 'launchy'
  gem 'rspec-rails', '3.4.2'
  gem 'ZenTest', '4.11.1'
end

group :production do
  gem 'pg'
end

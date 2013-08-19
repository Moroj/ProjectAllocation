source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.12'
gem 'therubyracer'
gem 'bcrypt-ruby', '3.0.1'
gem 'whenever', :require => false
#gem "auto_increment"
gem 'heroku'
gem "acts_as_list"
gem 'rspec'
gem 'bootstrap-sass', '~> 2.3.2.1'
#gem 'ranked-model', "~> 0.3"
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do 
  #gem 'sqlite3', '1.3.5'
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem "jquery-rails"
  gem "jquery-ui-rails"
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  
  gem 'uglifier', '1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rspec-rails', '2.11.0'
end

group :production do
  #gem 'pg', '0.12.2'
  gem 'therubyracer-heroku', '0.8.1.pre3'
  gem 'pg', :require => 'pg'
  gem 'thin'
end

#gem 'jquery-rails'
gem 'devise'          

#gem 'will_paginate', '3.0.pre2'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

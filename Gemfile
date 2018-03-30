source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

group :production do
  # Use pg as the production database for Active Record
  gem 'pg', '~> 0.20'
  gem 'rails_12factor'
end

group :development do
  # Use sqlite3 as the development database for Active Record
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_bot_rails'
end

group :test do
  gem 'database_cleaner'
end 

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'thor', '0.20.0'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'
gem 'autoprefixer-rails'

# Used for encrypting passwords
gem 'bcrypt'

# Flexible authentication solution for Rails with Warden.
gem 'devise'

# Use Figaro for private variables
gem 'figaro', '1.0'

# Use Pundit authorization system.
gem 'pundit'

# Seeding Data
gem 'faker'

# Use Stripe internet payment app
gem 'stripe'

# Use to load environment variables from '.env'
gem 'dotenv-rails', :groups => [:development, :test]







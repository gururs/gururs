source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'

# Database
gem 'pg'
gem 'foreigner'

# Server
gem 'thin'

# I18n
gem 'rails-i18n'

# Improvements
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'simple_form'

gem 'font-awesome-sass-rails' # rails_admin dependence
gem 'rails_admin', github: 'sferik/rails_admin', branch: 'rails-4'
gem 'cancan'

# I18n
gem 'rails-i18n'
gem 'devise-i18n'

# Authentication
gem 'devise', '~> 3.0.0.rc'
gem 'omniauth'
gem 'omniauth-github'

# Frontend stuff
gem 'jquery-rails', '~> 2.1'
gem 'slim-rails'
gem 'initjs'
gem 'flutie'
gem 'rack-google-analytics'

# Assets
gem 'sass-rails', '4.0.0'
gem 'coffee-rails', '4.0.0'
gem 'uglifier'
gem 'turbolinks'
gem 'bootstrap-sass'

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14.0.rc1'
  gem 'shoulda-matchers'
  gem 'machinist'
  gem 'capybara'
  gem 'pry'
  gem 'awesome_print'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
end

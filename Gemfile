source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '>= 2.2'

gem 'rails', '~> 5.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use Puma as the app server
gem 'puma', '~> 4.3'

gem 'rubycas-client'
gem 'rake'
gem 'delayed_job_active_record'
gem 'daemons'

gem 'mail'

gem 'whenever'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'turbolinks'

# For automatic inline CSS for mailer
gem 'hpricot'
gem 'premailer-rails'

# For JS-accessible routes
gem "js-routes", '~> 1.4.9'

gem 'jbuilder', '~> 2.5'

gem 'mysql2', '~> 0.4.0'
gem 'sqlite3' # for testing

gem 'jquery-rails'

# For Bootstrap support
gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '~> 5.0'

# For loading remote JSON
gem 'rest-client'

# For profiling memory usage of gems
gem 'derailed', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# For AWS DynamoDB support, used in message receipts
gem 'aws-sdk-dynamodb', '~> 1.6'
gem 'aws-sdk-core', '~> 3.0'

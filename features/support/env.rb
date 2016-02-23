require 'coveralls'
Coveralls.wear!
require 'cucumber/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

# Something is setting request.host to 'example.org', so the step definitions
# need that set too
Before { host! 'example.org' }

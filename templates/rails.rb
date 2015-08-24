# 1. GEMS

gem 'pg' # We use Postgresql for database
gem 'bcrypt'
gem 'quiet_assets' # To hide assets from development logs
gem 'hirb' # For readable console output
gem 'bootstrap-sass' # For admin panel
gem 'bootstrap-datepicker-rails' # For date pickers
gem 'responders' # So we can enable respond_to/respond_with
gem 'pry' # Easier debug
gem 'paperclip' # For file uploads
gem 'figaro' # For application configuration
gem 'slim-rails' # For manageable templates
gem 'rubocop', require: false # For keeping consistent style
gem 'rubocop-rspec', require: false # The same, but for tests

gem_group :production do
  gem 'rails_12factor' # For deployment purposes
end

gem_group :development do
  gem 'letter_opener' # For testing emails in development
end

gem_group :development, :test do
  gem 'rspec-rails' # We use rspec for tests
  gem 'factory_girl_rails' # We use factories instead of fixtures
  gem 'database_cleaner' # For integrational testing
end

gem_group :test do
  gem 'shoulda-matchers' # For compact expectations and testing model validations
  gem 'guard-rspec' # Auto runs exact tests on change
  gem 'capybara' # For integrationa; testing
  gem 'poltergeist' # Headles browser for testing javascript-enabled pages
  gem 'launchy' # Go figure...
  gem 'rack_session_access' # For accessing the session in rspec features
end

# 2. CONFIGURATION
environment 'config.action_mailer.delivery_method = :letter_opener', env: :development
environment 'config.middleware.use RackSessionAccess::Middleware', env: :test
application <<GENERATORS
config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false

      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
GENERATORS

# 3. RUN COMMANDS
run 'rails g rspec:install'
run 'guard init rspec'
run 'rm README.rdoc'
run 'rm app/assets/stylesheets/application.css'
run 'rm -rf test'
run 'cp -R ~/dotfiles/templates/files/ .'

after_bundle do
  git :init

  puts <<-INSTRUCTIONS

POST-INIT INSTRUCTIONS
---

→ Update database names in config/database.yml
  INSTRUCTIONS
end

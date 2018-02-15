RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    # Rails.application.load_seed # loading seeds
    # load Rails.root + "db/seeds/languages.rb"
  end

  config.around(:each) do |example|
    # Use really fast transaction strategy for all
    # examples except `js: true` capybara specs
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction

    # Start transaction
    DatabaseCleaner.cleaning do

      # Run example
      example.run
    end

    # if example.metadata[:js]
    #   Rails.application.load_seed # loading seeds
    #   load Rails.root + "db/seeds/languages.rb"
    # end

    # Clear session data
    Capybara.reset_sessions!
  end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

end
# -*- coding: utf-8 -*-

if ENV['COVERAGE']
  require "simplecov"

  SimpleCov.start :test_frameworks do
    add_filter "/vendor/bundle/"
  end
end

require 'configatron_safe'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("./support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  # config.mock_with :rspec
  config.mock_with :rr
end

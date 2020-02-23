require 'capybara/rspec'
require 'capybara/dsl'
require 'rack/test'
require 'pry'
require 'rspec'
require 'shoulda/matchers'
require 'vcr'
require 'webmock/rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../upvote.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# Define the application we're testing
def app
  # Load the application defined in config.ru
  Rack::Builder.parse_file('config.ru').first
end

# Configure Capybara to test against the application above.
Capybara.app = app

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara
  config.include RSpecMixin
  config.order = 'default'
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end
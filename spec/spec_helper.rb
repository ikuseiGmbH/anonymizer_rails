# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/dummy/spec' # don't include the spec directory
  add_filter 'spec/dummy/config'
end

require File.expand_path('dummy/config/environment.rb', __dir__)
require 'rspec/rails'
require 'rspec/autorun'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
end

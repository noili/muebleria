if ENV['CODECLIMATE_REPO_TOKEN'] && ENV['CI_BRANCH'] &&
                                    ENV['CI_BRANCH'] == 'master'
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module RequireAuthentication
  def login
    session[:user_id] = users(:admin).id
  end

  def setup
    login
  end

  def test_authentication_is_required_on_index
    authentication_required_for :index
  rescue ActionController::UrlGenerationError
  end

  def authentication_required_for *action_args
    session.clear
    process *action_args
    assert_redirected_to new_session_path
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

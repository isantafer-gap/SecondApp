# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
#require 'rspec/autorun'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Chrome.driver_path = '/home/isantacruz/Documents/Drivers/chromedriver'
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Selenium::WebDriver::Firefox.driver_path = "/home/isantacruz/Documents/Drivers/geckodriver"
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.run_server = false
Capybara.app_host = 'https://square-root.com/'
Capybara.default_max_wait_time = 60

RSpec.configure do |config|
  
  config.include Capybara::DSL, :type => :feature
  require 'rspec/expectations'
  config.include RSpec::Matchers
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,
    browser: :chrome,
    args: ["--window-size=1024,768"]
  )
end
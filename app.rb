require "sinatra"
require "selenium-webdriver"
require "google/cloud/secret_manager"

#use Google::Cloud::Logging::Middleware

set :bind, "0.0.0.0"
port = ENV["PORT"] || "8080"
set :port, port

options = Selenium::WebDriver::Chrome::Options.new
options.page_load_strategy = :normal
# to run Chrome in headless mode
options.add_argument("--headless") # comment out in development
# create a driver instance to control Chrome
# with the specified options


get '/' do
  'Hello, world!'
end

get '/run' do
  driver = Selenium::WebDriver.for :chrome, options: options
  driver.navigate.to 'https://arkkies.com' # Replace with your desired URL
  "Title: #{driver.title}"
end

# Gracefully quit the driver when the application exits
at_exit do
end

# frozen_string_literal: true

Before do
    Capybara.register_driver :chrome do |app|
      caps = if ENV['HEADLESS'].eql?('false')
               Selenium::WebDriver.for :chrome
             else
               Selenium::WebDriver::Remote::Capabilities.chrome(
                 chromeOptions: { 
                   args: %w(headless disable-gpu window-size=1280,2000 no-sandbox)
                 }
               )
             end
      
      Capybara::Selenium::Driver.new(
        app, 
        :browser => :chrome)
      end
  
    Capybara.default_driver = :chrome
    Capybara.default_max_wait_time = 10
  end
  

  
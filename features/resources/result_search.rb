# frozen_string_literal: true

module Resources
  class ResultSearch < SitePrism::Page
    element :results_label, :xpath, '//*[@id="mainContent"]/div[1]/div/div[2]/div/div[1]/h1/span[1]'
    element :result_container, '#srp-river-results'
    element :button_better_result, :xpath, '//*[@id="mainContent"]/div[1]/div/div[1]/div[3]/div[1]'
    
    def result_text
      puts 'The result is:'
      puts results = results_label.text
      results
    end

    def order_price
      wait_until_button_better_result_visible
      button_better_result.click 
      button_better_result.click
      button_better_result.click
      find(:xpath, "//*[@id='w23-content-0[3]']").click
    end
  end
end

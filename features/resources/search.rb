# frozen_string_literal: true

module Resources
  # In this class there are all the elements of Index page
  # and its main actions
  class Search < SitePrism::Page
    element :search_field_articles, '#gh-ac'
    element :button_search, '#gh-btn'
    element :search_field_brand, :xpath, '//*[@id="w4-w12-0[0]"]'
    element :brand_container, '#x-refine__group_1__1'
    element :size_container, :xpath, '//*[@id="x-refine__group_1__0"]'

  
    def index_page
      visit 'https://www.ebay.com/'
    end
  
    def search_articles(searchable, keyword)
      search_articles_keyword(searchable, keyword)
      case searchable
      when 'Article'
        button_search_click
      when 'Brand' 
        select_brand_click(keyword)
      end 
    end
  
    def select_size(keyword)
      select_size_click(keyword) 
    end

    private
  
    def search_articles_keyword(searchable, keyword)
      case searchable
      when 'Article'
        @field = search_field_articles
      when 'Brand'
        @field = search_field_brand
      end
      @field.set keyword
    end
  
    def button_search_click
      wait_until_button_search_visible
      button_search.click
    end

    def select_brand_click(keyword)
      wait_until_brand_container_visible
      items = brand_container.all('a', text: keyword)
      items.first.click
    end

    def select_size_click(keyword)
      wait_until_size_container_visible
      items = size_container.all('a', text: keyword)
      items.first.click
    end
  end
end
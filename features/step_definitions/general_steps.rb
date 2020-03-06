# frozen_string_literal: true

Given ('User goes to the Ebay page') do
  @index = Resources::Search.new
  @index.index_page
end

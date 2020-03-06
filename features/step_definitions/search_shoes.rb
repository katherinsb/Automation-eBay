# frozen_string_literal: true

When ('User search {string}') do |keyword|
  @index.search_articles('Article', keyword)
end

And ('User select brand {string}') do |keyword|
  @index.search_articles('Brand', keyword) 
end

And ('User select size {string}') do |keyword|
  @index.select_size(keyword) 
end




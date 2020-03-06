Then ('Print the number of results') do
    @results = Resources::ResultSearch.new
    @results.result_text
end

And('Order by price ascendant') do
  @results.order_price
end

And('Assert the order taking the first {int} results') do |total_asserts|
  @data_results = Helper.order_data(@results, 'Array')
  
  @data_results.each_with_index do |data, index|
    break if index.eql? total_asserts.to_i
  
    expect(data[1]).to be <= @data_results[index + 1][1]
  end
end

And('Order and print the products by name in ascendant mode') do
    data_results = Helper.order_data(@results, 'Array of Hashes')
    data_results.sort_by! { |data| data[:name] }
    Helper.print_results(data_results)
  end
  
And('Order and print the products by price in descendant mode') do
  data_results = Helper.order_data(@results, 'Array of Hashes')
  data_results.sort_by! { |data| -data[:full_price] }
  Helper.print_results(data_results)
end
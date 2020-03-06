module Helper
      def self.convert_shipping(text)
        if text.match?(/^\+COP \$(.*) por el envío/)
          text.match(/^\+COP \$(.*) por el envío/)[1].tr(' ','').to_f
        else
          0.0
        end
      end

      
      def self.convert_price(text)
        text.match(/^COP \$(.*)/)[1].tr(' ','').to_f
      end


    def self.order_data(results_page, format)
        items = results_page.result_container.all('li', class: 's-item')
        @data_results = Array.new
    
        items.each do |item|
          name = item.all('h3', class: 's-item__title').first.text
          price = Helper.convert_price(item.all('span', class: 's-item__price').first.text)
          shipping = Helper.convert_shipping(item.all('span', class: 's-item__shipping').first.text)
          @data_results << [name, price + shipping] if format.eql? 'Array'
          @data_results << {name: name, full_price: (price + shipping).round(2)} if format.eql? 'Array of Hashes'
        end
        @data_results
      end

      def self.print_results(data)
        col_labels = { name: "Name", full_price: "Price" }
        @columns = col_labels.each_with_object({}) { |(col, label), h|
          h[col] = {
            label: label,
            width: [data.map { |g| g[col].to_s.size }.max, label.to_s.size].max
          }
        }
        write_divider
        write_header
        write_divider
        data.each { |h| write_line(h) }
        write_divider
      end
    
      def self.write_header
        puts "| #{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' | ') } |"
      end
    
      def self.write_divider
        puts "+-#{ @columns.map { |_,g| "-"*g[:width] }.join("-+-") }-+"
      end
    
      def self.write_line(info)
        str = info.keys.map { |k| info[k].to_s.ljust(@columns[k][:width]) }.join(' | ')
        puts "| #{str} |"
      end
end
    
World(Helper)
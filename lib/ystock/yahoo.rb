module Ystock
	class Yahoo
	    @@service_uri = "http://download.finance.yahoo.com/d/quotes.csv"
	   
		def self.quote(stocks)
			if stocks.is_a? Array
				# => Many stocks
				find(stocks)
			else
				# => Single Stock
				get_quote(stocks)
			end
		end
		
		private
		def self.find(args)
			stock_string = ""
			last_stock = args.last.to_s
	        args.each do |stock|
				if last_stock == stock.to_sym
					stock_string += stock.to_s
				else
					stock_string += stock.to_s + ","
				end
	        end
			format(send_request(stock_string))
		end
	    
	    def self.get_quote(stock)
	        stock_data = Hash.new
	        s = send_request(stock)
	        a = s.chomp.split(",") 
	        return {:symbol => stock,
	                :price => a[0],
	                :change => a[1],
	                :volume => a[2],
					:change_percent => a[4],
					:open => a[5],
					:day_high => a[6],
					:day_low => a[7]
	                }
	    end
		
		def self.format(results)
			output = Array.new
			results.each_line("\n") do |row|
				stockdata = row.split(",")
				if !stockdata.nil?
					if !stockdata[3].nil?
						stockdata[3] = stockdata[3].gsub("\r\n", "").gsub('"', '')

						output << {:symbol => stockdata[3],
			         		:price => stockdata[0],
			         		:change => stockdata[1],
			         		:volume => stockdata[2],
							:change_percent => stockdata[4],
							:open => stockdata[5],
							:day_high => stockdata[6],
							:day_low => stockdata[7]}

					end
				end
			end
	        return output
		end

	    def self.send_request(args)
	        completed_path = @@service_uri + "?f=l1c1v1sk2ohg&s=" + args
	        uri = URI.parse(completed_path)
	        response = Net::HTTP.start(uri.host, uri.port) do |http|
	            http.get completed_path
	        end
	        return response.body
	     end

		def self.version
			return Gem::VERSION
		end
		
	end
end
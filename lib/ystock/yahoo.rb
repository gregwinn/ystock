module Ystock
	class Yahoo
	    @@service_uri = "http://download.finance.yahoo.com/d/quotes.csv"
	   
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
	        return [{:symbol => stock,
	                :price => a[0],
	                :change => a[1],
	                :volume => a[2]
	                }]
	    end
		
		def self.format(results)
			output = Array.new
			results.each_line("\n") do |row|
				stockdata = row.split(",")
				if !stockdata.nil?
					if !stockdata[3].nil?
						stockdata[3] = stockdata[3].gsub("\r\n", "").gsub('"', '')

						output << [{:symbol => stockdata[3],
			         		:price => stockdata[0],
			         		:change => stockdata[1],
			         		:volume => stockdata[2]}]

					end
				end
			end
	        return output
		end

	    def self.send_request(args)
	        completed_path = @@service_uri + "?f=l1c1v1s&s=" + args
	        uri = URI.parse(completed_path)
	        response = Net::HTTP.start(uri.host, uri.port) do |http|
	            http.get completed_path
	        end
	        return response.body
	     end

		def self.version
			return Gem::VERSION
		end
		
		def self.test
			return "Test is working 2"
		end
	end
end
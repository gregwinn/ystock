module Ystock
	class Google
		@@google_service = "http://www.google.com/ig/api"

		def self.quote(args)
			if args.is_a? Array
				many_stocks(args)
			else
				single_stock(args)
			end
		end

		def self.many_stocks(stocks)
			stock_string = ""
			stocks.each do |stock|
				if stocks.first == stock
					stock_string += "?stock=" + stock
				else
					stock_string += "&stock=" + stock
				end
			end
			format(send_request(stock_string), true)
		end

		def self.single_stock(stock)
			stock = "?stock=" + stock
			format(send_request(stock), false)
		end
	
		def self.format(results, is_many)
			output = Array.new
		
			results.each do |item|

				if is_many
					# => Multiple Stocks
					item[1]["finance"].each do |stock|
						stock_data = Hash.new
						stock.each do |key, val|
							stock_data[:"#{key}"] = (!val["data"].nil?) ? val["data"] : val
						end
						output << [stock_data]
					end
					
				else
					# => Single Stock
					stock_data = Hash.new
					item[1]["finance"].each do |key, val|
						stock_data[:"#{key}"] = (!val["data"].nil?) ? val["data"] : val
					end
					output = stock_data
				end
			end
			
			return output
		
		end
	
		def self.send_request(args)
			url = @@google_service + args
			return HTTParty.get(url)
		end
	end
end
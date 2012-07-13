# => Ystock::Google
module Ystock
	class Google
		#@@google_service = "http://finance.google.com/finance/info"
		@@google_service = "http://www.google.com/ig/api"
		# => Ystock::Google.find(["aapl", "goog"])
		def self.find(args)
			first_stock = args.first
			stock_string = ""
			args.each do |stock|
				if first_stock == stock
					stock_string += "?stock=" + stock
				else
					stock_string += "&stock=" + stock
				end
			end
			# => Send Request to get quote then format
			format(send_request(stock_string))
		end
	
		def self.get_quote(arg)
			arg = "?stock=" + arg	
			# => One stock
			format(send_request(arg))
		end
	
		def self.format(results)
			output = Hash.new
		
			results.each do |item|
				item[1]["finance"].each do |stock|
					output[stock["symbol"]["data"].to_sym] = {
						:symbol => stock["symbol"]["data"],
						:market => stock["exchange"]["data"],
						:price => stock["last"]["data"],
			            :change => stock["change"]["data"],
						:volume => stock["volume"]["data"]
					}
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
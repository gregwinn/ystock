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
			format(send_request(stock_string), true)
		end
	
		def self.get_quote(arg)
			arg = "?stock=" + arg	
			# => One stock
			format(send_request(arg), false)
		end
	
		def self.format(results, is_many)
			output = Hash.new
		
			results.each do |item|
				if is_many
					item[1]["finance"].each do |stock|
						output[stock["symbol"]["data"].to_sym] = {
							:symbol => stock["symbol"]["data"],
							:market => stock["exchange"]["data"],
							:price => stock["last"]["data"],
				            :change => stock["change"]["data"],
							:volume => stock["volume"]["data"],
							:company => stock["company"]["data"],
							:high => stock["high"]["data"],
							:low => stock["low"]["data"],
							:avg_volume => stock["avg_volume"]["data"],
							:market_cap => stock["market_cap"]["data"],
							:perc_change => stock["perc_change"]["data"],
							:y_close => stock["y_close"]["data"],
							:open => stock["open"]["data"]
						}
					end
				else
					output = {
						:symbol => item[1]["finance"]["symbol"]["data"],
						:market => item[1]["finance"]["exchange"]["data"],
						:price => item[1]["finance"]["last"]["data"],
			            :change => item[1]["finance"]["change"]["data"],
						:volume => item[1]["finance"]["volume"]["data"],
						:company => item[1]["finance"]["company"]["data"],
						:high => item[1]["finance"]["high"]["data"],
						:low => item[1]["finance"]["low"]["data"],
						:avg_volume => item[1]["finance"]["avg_volume"]["data"],
						:market_cap => item[1]["finance"]["market_cap"]["data"],
						:perc_change => item[1]["finance"]["perc_change"]["data"],
						:y_close => item[1]["finance"]["y_close"]["data"],
						:open => item[1]["finance"]["open"]["data"]
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
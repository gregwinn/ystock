module Ystock
	class Google
		@@google_service = "http://www.google.com/ig/api"
		def self.find(args)
			stock_string = ""
			args.each do |stock|
				if args.first == stock
					stock_string += "?stock=" + stock
				else
					stock_string += "&stock=" + stock
				end
			end
			format(send_request(stock_string), true)
		end
	
		def self.get_quote(arg)
			arg = "?stock=" + arg
			format(send_request(arg), false)
		end
	
		def self.format(results, is_many)
			output = Array.new
		
			results.each do |item|

				if is_many
					
					item[1]["finance"].each do |stock|
						stock_data = Hash.new
						stock.each do |key, val|
							stock_data[:"#{key}"] = (!val["data"].nil?) ? val["data"] : val
						end
						output << [stock_data]
					end
					
				else
					stock_data = Hash.new
					item[1]["finance"].each do |key, val|
						stock_data[:"#{key}"] = (!val["data"].nil?) ? val["data"] : val
					end
					output = [stock_data]
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
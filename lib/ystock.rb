#
# Yahoo Stock find
# gem ystock
#
# by Greg Winn
# winn.ws
# http://github.com/gregwinn/ystock
#
require 'cgi'
require 'json'
require 'net/http'
module Ystock
    def ensure_unique(name)
        begin
            self[name] = yield
        end while self.class.exists?(name => self[name])
    end
    
	@@service_uri = "http://download.finance.yahoo.com/d/quotes.csv"
	
	# => Ystock::Google
	class Google
		@@google_service = "http://finance.google.com/finance/info"
		# => Ystock::Google.find(["aapl", "goog"])
		def self.find(args)
			last_stock = args.last
			stock_string = ""
			args.each do |stock|
				if last_stock == stock
					stock_string += stock
				else
					stock_string += stock + ","
				end
			end
			# => Send Request to get quote then format
			format(send_request(stock_string))
		end
		
		def self.get_quote(arg)
			# => One stock
			format(send_request(arg))
		end
		
		def self.format(results)
			output = Hash.new
			results.each do |result|
				output[result["t"].to_sym] = {
					:symbol => result["t"],
					:market => result["e"],
					:price => result["l"],
		            :change => result["c"]
				} 
			end
			return output
		end
		
		def self.send_request(args)
			url = @@google_service + "?client=ig&q="
			url += args
			resp = Net::HTTP.get_response(URI.parse(url))
			data = resp.body.gsub("//", "")
			# => Result = Hash
			result = JSON.parse(data)
		end
	end
     
    # Ystock.find(['stock', 'stock'])
	def self.find(args)
		stock_string = ""
		last_stock = args.last.to_s
        args.each do |stock|
			if last_stock == stock.to_s
				stock_string += stock.to_s
			else
				stock_string += stock.to_s + ","
			end
        end
		format(send_request(stock_string))
	end
    
    def self.get_stock(stock)
        output = Hash.new
        s = send_request(stock)
        a = s.chomp.split(",")
        output[stock.to_sym] = {:symbol => stock,
                :price => a[0],
                :change => a[1],
                :volume => a[2]
                }
        return output
    end
	
	def self.format(results)
		output = Hash.new
		results.each_line("\n") do |row|
			stockdata = row.split(",")
			stockdata[3] = stockdata[3].gsub("\r\n", "").gsub('"', '')
			output[stockdata[3].to_sym] = {:symbol => stockdata[3],
	         :price => stockdata[0],
	         :change => stockdata[1],
	         :volume => stockdata[2]}
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
    
end
class ActiveRecord::Base
  include Ystock
end
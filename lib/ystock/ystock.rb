
	class Ystock
	    @@service_uri = "http://download.finance.yahoo.com/d/quotes.csv"

		def self.quote(stocks)
			if stocks.is_a? Array
				# => Many stocks
				format(send_request(stocks.join(",")))
			else
				# => Single Stock
				format(send_request(stocks)).first
			end
		end

		private
		def self.format(results)
			output = Array.new
			results.each_line("\n") do |row|
				stockdata = row.split(",")
				if !stockdata.nil?

					# => Check to see if the Symbol is nil
					if !stockdata[3].nil?
						stockdata[3] = stockdata[3].gsub("\r\n", "").gsub('"', '')

						output << {:symbol => stockdata[3],
			         		:price => stockdata[0],
			         		:change => stockdata[1],
			         		:volume => stockdata[2],
							:change_percent => stockdata[4].gsub("\r\n", "").gsub('"', ''),
							:open => stockdata[5],
							:day_high => stockdata[6],
							:day_low => stockdata[7],
							:previous_close => stockdata[8],
							:after_hours_change => stockdata[9].gsub("\r\n", "").gsub('"', ''),
							:ma50 => stockdata[10],
							:ma200 => stockdata[11],
							:week52_range => stockdata[12].gsub("\r\n", "").gsub('"', ''),
							:pe_ratio => stockdata[13],
							:exchange => stockdata[14],
							:float => stockdata[15],
							:short_ratio => stockdata[16]
						}

					end
				end
			end
	        return output
		end

	    def self.send_request(args)
	        completed_path = @@service_uri + "?f=l1c1vsp2ohgpc8m3m4wr2xf6s7&s=" + args
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


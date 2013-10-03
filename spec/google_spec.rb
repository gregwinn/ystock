# => Google Tests
require "./lib/ystock/google.rb"
require 'httparty'
describe Ystock, "Errors" do
	it "send_request should raise TypeError" do
		# => Below is incorrect usage, and is just for testing proposes.
		lambda { Ystock::Google.send_request(nil) }.should raise_error(TypeError)
	end

	it "many_stocks should raise NoMethodError" do
		# => Below is incorrect usage, and is just for testing proposes.
		lambda { Ystock::Google.many_stocks("aapl") }.should raise_error(NoMethodError)
	end

	it "single_stock should rase TypeError" do
		# => Below is incorrect usage, and is just for testing proposes.
		lambda { Ystock::Google.single_stock(["aapl", "goog"]) }.should raise_error(TypeError)
	end

	# => For correct usage please see the readme file.
end

describe Ystock, "Formats" do
	it "should be a usable format" do
		results = {"xml_api_reply"=>{"version"=>"1", "finance"=>{"module_id"=>"0", "tab_id"=>"0", "mobile_row"=>"0", 
					"mobile_zipped"=>"1", "row"=>"0", "section"=>"0", "symbol"=>{"data"=>"AAPL"}, "pretty_symbol"=>{"data"=>"AAPL"}, 
					"symbol_lookup_url"=>{"data"=>"/finance?client=ig&q=AAPL"}, "company"=>{"data"=>"Apple Inc."}, 
					"exchange"=>{"data"=>"Nasdaq"}, "exchange_timezone"=>{"data"=>"ET"}, "exchange_utc_offset"=>{"data"=>"+05:00"}, 
					"exchange_closing"=>{"data"=>"960"}, "divisor"=>{"data"=>"2"}, "currency"=>{"data"=>"USD"}, 
					"last"=>{"data"=>"489.54"}, "high"=>{"data"=>"491.80"}, "low"=>{"data"=>"483.75"}, "volume"=>{"data"=>"7299314"}, 
					"avg_volume"=>{"data"=>"13959"}, "market_cap"=>{"data"=>"444742.08"}, "open"=>{"data"=>"485.63"}, 
					"y_close"=>{"data"=>"487.96"}, "change"=>{"data"=>"+1.58"}, "perc_change"=>{"data"=>"0.32"}, "delay"=>{"data"=>"0"}, 
					"trade_timestamp"=>{"data"=>"7 seconds ago"}, "trade_date_utc"=>{"data"=>"20131002"}, "trade_time_utc"=>{"data"=>"174339"}, 
					"current_date_utc"=>{"data"=>"20131002"}, "current_time_utc"=>{"data"=>"174346"}, 
					"symbol_url"=>{"data"=>"/finance?client=ig&q=AAPL"}, "chart_url"=>{"data"=>"/finance/chart?q=NASDAQ:AAPL&tlf=12"}, 
					"disclaimer_url"=>{"data"=>"/help/stock_disclaimer.html"}, "ecn_url"=>{"data"=>""}, "isld_last"=>{"data"=>""}, 
					"isld_trade_date_utc"=>{"data"=>""}, "isld_trade_time_utc"=>{"data"=>""}, "brut_last"=>{"data"=>""}, 
					"brut_trade_date_utc"=>{"data"=>""}, "brut_trade_time_utc"=>{"data"=>""}, "daylight_savings"=>{"data"=>"true"}}}}
		format = Ystock::Google.format(results, false)
		format[:pretty_symbol].should eq("AAPL")
	end

	it "should make a sucsessful request and return data" do
		# => Make a live request
		# Using AAPL => Apple Inc.
		stock = Ystock::Google.quote("AAPL")

		# => Result should be the name of the company from the symbol above.
		stock[:company].should eq("Apple Inc.")
	end
end

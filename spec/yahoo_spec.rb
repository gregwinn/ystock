# => Yahoo Tests
require 'spec_helper'
require "./lib/ystock/yahoo.rb"
describe Ystock do
	context "service response" do
		it "should retrieve stock symbol" do
			stock = Ystock::Yahoo.quote("AAPL")
			expect(stock[:symbol]).to include("AAPL")
		end
		it "should retrieve stock symbol for first stock" do
			stock = Ystock::Yahoo.quote(["goog", "AAPL"])
			expect(stock[0][:symbol]).to include("GOOG")
		end
	end
end


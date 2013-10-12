# => Yahoo Tests
require 'spec_helper'
require "./lib/ystock/yahoo.rb"
describe Ystock do
	context "service response" do
		it "should retrieve stock symbol" do
			stock = Ystock::Yahoo.quote("AAPL")
			stock[:symbol].should eq("AAPL")
		end
		it "should retrieve stock symbol for first stock" do
			stock = Ystock::Yahoo.quote(["goog", "AAPL"])
			stock[0][:symbol].should eq("GOOG")
		end
	end
end


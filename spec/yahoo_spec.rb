# => Yahoo Tests
require 'spec_helper'
require "./lib/ystock/yahoo.rb"
describe Ystock do
	context "service response" do
		it "should retrieve stock symbol" do
			stock = Ystock::Yahoo.quote("AAPL")
			stock[:symbol].should eq("AAPL")
		end
	end
end

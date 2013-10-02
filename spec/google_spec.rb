# => Google Tests
require "../ystock/ystock.rb"
describe Google, "#result" do
	it "request fails if no args are provided" do
		Ystock::Google.send_request(nil)
	end
end
# => Google Tests
require "./lib/ystock/google.rb"
describe Google, "#result" do
	it "request fails if no args are provided" do
		Ystock::Google.send_request(nil)
		# => uninitialized constant Google (NameError)
	end
end
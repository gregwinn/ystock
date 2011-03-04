#
# Yahoo Stock find
# gem ystock
#
# by Greg Winn
# winn.ws
# http://github.com/gregwinn/ystock
#
require 'cgi'
require 'net/http'
module Ystock
    def ensure_unique(name)
        begin
            self[name] = yield
        end while self.class.exists?(name => self[name])
    end
    
     @@service_uri = "http://download.finance.yahoo.com/d/quotes.csv"
     
     # Ystock.find(['stock', 'stock'])
     def find(args)
         output = Array.new
         args.each do |stock|
             s = send_request(stock.to_s)
             a = s.chomp.split(",")
             output << {:symbol => stock.to_s,
              :price => a[0],
              :change => a[1],
              :volume => a[2]}

         end
         return output
     end
     
    def self.get_stock(stock)
        output = Array.new
        s = send_request(stock)
        a = s.chomp.split(",")
        output = {:symbol => stock,
                :price => a[0],
                :change => a[1],
                :volume => a[2]
                }
        return output
    end

    def self.send_request(*args)
        completed_path = @@service_uri + construct_args(*args)
        uri = URI.parse(completed_path)
        response = Net::HTTP.start(uri.host, uri.port) do |http|
            http.get completed_path
        end
        return response.body
     end

     def self.construct_args(*args)
        path = "?f=l1c1v&s=" + args.map{|x| CGI.escape(x)}.join(",")
     end
    
end
class ActiveRecord::Base
  include Ystock
end
# Ystock

Get stock information from Yahoo Finance and Google (in beta)

## Install
Add the following to your Gemfile
```ruby
gem "ystock", "~> 0.3.4"
```

### Dependancies 
Please note 'httparty' is required to run this gem.


Then run bundle install

----

# Basic Usage

## Single stock
After you have installed the gem and included it into your Gemfile you can now start to use ystock.

1. In a controller you can do the following:
```ruby
class SomeController < ApplicationController
   def index
      @stock = Ystock.get_stock('appl')
   end
end
```

2. In your view you may display the results:

```html+ruby
<p>The price of Apple stock is: $<%=@stock[:AAPL][:price]%></p>
```

#### Available data
```
<%=@stock[:AAPL][:price]%>
<%=@stock[:AAPL][:change]%>
<%=@stock[:AAPL][:volume]%>
```

## Usage many stocks
After you have installed the gem and included it into your Gemfile you can now start to use ystock.

1. In a controller you can do the following:
```ruby
class SomeController < ApplicationController
   def index
      @stocks = Ystock.find(["aapl", "goog"])
   end
end
```

2. In your view you may display the results:

```ruby
@stocks.each do |sym, values|
     # sym -> AAPL
     # values[:price], values[:change], values[:volume] 
     puts values[:price]
end
```

----

# Google Stock (Beta)
I have added Google finance to this gem due to the number of stocks not supported by Yahoo.

## Usage for multiple stocks

```
@stocks = Ystock::Google.find(["aapl","goog"])

<%=@stocks[:AAPL][:price]%>
<%=@stocks[:AAPL][:change]%>
<%=@stocks[:AAPL][:volume]%>
<%=@stocks[:AAPL][:market]%>
```

```ruby
@stocks.each do |sym, value|
     puts value[:price]
end
```

#### Sample response
```
{:AAPL=>{:symbol=>"AAPL", :market=>"Nasdaq", :price=>"598.90", :change=>"-5.53", :volume=>"15285309"}, :GOOG=>{:symbol=>"GOOG", :market=>"Nasdaq", :price=>"570.48", :change=>"-0.71", :volume=>"2310094"}}
```

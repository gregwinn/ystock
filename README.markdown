# Ystock

Get stock information from Yahoo Finance

## Install
Add the following to your Gemfile
```ruby
gem "ystock", "~> 0.3.0"
```
Then run bundle install

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
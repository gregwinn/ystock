# Ystock
This gem provides you with the latest market data avalable, pulling from both Google and Yahoo Finance.

[![Gem Version](https://badge.fury.io/rb/ystock.png)](http://badge.fury.io/rb/ystock) [![Build Status](https://travis-ci.org/gregwinn/ystock.png?branch=master)](https://travis-ci.org/gregwinn/ystock) [![Code Climate](https://codeclimate.com/github/gregwinn/ystock.png)](https://codeclimate.com/github/gregwinn/ystock)

## Install
Add the following to your Gemfile
```ruby
gem "ystock", "~> 0.4.0"
```

### Dependancies 
Please note 'httparty' is required to run this gem.

## Bundle
```
bundle install
```

----

# Google Usage

This uses the Google Finance API to request the latest market information (up to 15 min delay). The Google Fincance API tends to return better and more usful information on the stock requested.

### Single Stock
```ruby
Ystock::Google.get_quote("appl")
```

### Multiple Stocks
```ruby
Ystock::Google.find(["aapl", "f", "goog"])
```

#### Available data
```
symbol
pretty_symbol
symbol_lookup_url
company
exchange
exchange_timezone
exchange_utc_offset
exchange_closing
divisor
currency
last
high
low
volume
avg_volume
market_cap
open
y_close
change
perc_change
delay
trade_timestamp
trade_date_utc
trade_time_utc
current_date_utc
current_time_utc
symbol_url
chart_url
disclaimer_url
ecn_url
isld_last
isld_trade_date_utc
isld_trade_time_utc
brut_last
brut_trade_date_utc
brut_trade_time_utc
daylight_savings
```

----

# Yahoo Usage

### Single Stock
```ruby
Ystock::Yahoo.get_quote("appl")
```

### Multiple Stocks
```ruby
Ystock::Yahoo.find(["aapl", "f", "goog"])
```

#### Available data
```
price
change
volume
symbol
```


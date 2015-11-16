# Ystock
This gem provides you with the latest market data avalable, pulling from Yahoo Finance.

[![Gem Version](https://badge.fury.io/rb/ystock.png)](http://badge.fury.io/rb/ystock) [![Build Status](https://travis-ci.org/gregwinn/ystock.png?branch=master)](https://travis-ci.org/gregwinn/ystock) [![Code Climate](https://codeclimate.com/github/gregwinn/ystock.png)](https://codeclimate.com/github/gregwinn/ystock) [![Coverage Status](https://coveralls.io/repos/gregwinn/ystock/badge.svg?branch=master&service=github)](https://coveralls.io/github/gregwinn/ystock?branch=master)

## Install
Add the following to your Gemfile
```ruby
gem "ystock", "~> 0.4.14"

# Or simply install it
gem install ystock -v=0.4.14
```

## Bundle
```
bundle install
```

### Sinatra or Ruby App
```
require 'ystock'
```

----

# Yahoo Usage
The examples below are how to use the Yahoo potion of the gem. All Yahoo requests are made with Ystock.quote

## Quote Usage
```ruby
# Single Stock lookup 'String'
Ystock.quote("aapl")

# Multiple Stock lookup [Array]
Ystock.quote(["aapl", "f", "goog"])
```

#### Available data
```
price
change
volume
symbol
change_percent
open
day_high
day_low
previous_close
after_hours_change
ma50 => 50 day moving average
ma200 => 200 day moving average
week52_range => 52 week range
pe_ratio => P/E Ratio (Realtime)
exchange
float
```

----

### Tested Ruby Versions
This gem was tested with:

Ruby: ~~1.9.2~~ -> No longer supported.

Ruby: 1.9.3

Ruby: 2.0.0

Ruby: 2.1.2

Ruby: 2.2.2


### Run RSpec tests
```
rspec spec/yahoo_spec.rb
```

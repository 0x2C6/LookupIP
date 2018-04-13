# Lookupip

Easy way to find ip address informations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lookupip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lookupip

## Usage

```ruby
require 'lookupip'

# IPv4

ip_info = LookupIP::V4.address '30.104.194.91'

puts ip_info.country    #=> "United States"
puts ip.state           #=> "Ohio"
puts ip_info.city       #=> "Columbus"
puts ip_info.isp        #=> "DoD Network Information Center"
puts ip_info.code       #=> "US"
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/0x2C6/LookupIP.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

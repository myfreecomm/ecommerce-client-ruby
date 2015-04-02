[![Gem Version](https://badge.fury.io/rb/ecommerce-client.svg)](http://badge.fury.io/rb/ecommerce-client)
[![Build Status](https://travis-ci.org/myfreecomm/ecommerce-client-ruby.svg?branch=master)](https://travis-ci.org/myfreecomm/ecommerce-client-ruby)
[![Code Climate](https://codeclimate.com/github/myfreecomm/ecommerce-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/myfreecomm/ecommerce-client-ruby)
[![Test Coverage](https://codeclimate.com/github/myfreecomm/ecommerce-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/ecommerce-client-ruby)
[![Inline docs](http://inch-ci.org/github/myfreecomm/ecommerce-client-ruby.svg)](http://inch-ci.org/github/myfreecomm/ecommerce-client-ruby)

# Ecommerce Client

A Ruby client for [Myfreecomm's Ecommerce REST API](http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html).

## Installation

Add this line to your application's Gemfile:

    gem 'ecommerce-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ecommerce-client

## Configuration

To access the Ecommerce API, you must provide the *token* and the *secret*:

```ruby
Ecommerce.configuration do |config|
  config.token = 'YOUR-TOKEN'
  config.secret = 'YOUR-SECRET'
end
```

## Usage

Ecommerce endpoints are represented as Resources. To check the list of all available Resources, please visit [Ecommerce::Resources](https://github.com/myfreecomm/ecommerce-client-ruby/tree/master/lib/ecommerce/resources) module folder.

```ruby
# listing orders of a plan
Ecommerce::Resources::Order.find_all('specific-plan')
=> #<Ecommerce::Resources::OrderCollection:0x000000028739b0...>
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/ecommerce-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

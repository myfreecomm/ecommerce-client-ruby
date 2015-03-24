require "typhoeus"
require "multi_json"

require "ecommerce/version"
require "ecommerce/configuration"
require "ecommerce/http"
require "ecommerce/client"

module Ecommerce
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token, secret)
    Client.new(token, secret)
  end
end

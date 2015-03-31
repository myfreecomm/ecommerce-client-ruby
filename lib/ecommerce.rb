require "typhoeus"
require "multi_json"

require "ecommerce/version"
require "ecommerce/configuration"
require "ecommerce/client"
require "ecommerce/attribute_handler"

require "ecommerce/resources/base"
require "ecommerce/resources/order"
require "ecommerce/resources/collection"

module Ecommerce
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client
    Client.new(Ecommerce.configuration.token, Ecommerce.configuration.secret)
  end
end

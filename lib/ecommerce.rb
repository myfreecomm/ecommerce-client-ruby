require "typhoeus"
require "multi_json"

require "ecommerce/version"
require "ecommerce/configuration"
require "ecommerce/client"
require "ecommerce/attribute_handler"

require "ecommerce/resources/base"
require "ecommerce/resources/collection"
require "ecommerce/resources/account_order"
require "ecommerce/resources/order"
require "ecommerce/resources/order_collection"
require "ecommerce/resources/invoice_order"
require "ecommerce/resources/invoice_order_collection"
require "ecommerce/resources/invoice_plan"
require "ecommerce/resources/adjustment_order"
require "ecommerce/resources/adjustment_order_collection"

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

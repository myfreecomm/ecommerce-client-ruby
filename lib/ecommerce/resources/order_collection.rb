module Ecommerce
  module Resources
    class OrderCollection < Base
      attr_reader :response, :orders

      def initialize(response)
        @response = response
        @orders = []
      end

      def self.build(response)
        self.new(response).build
      end

      def build
        Ecommerce::Resources::Base.parsed_body(response).each do |order_attributes|
          orders.push(Ecommerce::Resources::Order.new(order_attributes))
        end

        self
      end
    end
  end
end

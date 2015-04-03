module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce orders API.
    #
    class OrderCollection < Collection
      def orders
        collection
      end

      private

      def build_collection
        Ecommerce::Resources::Base.parsed_body(response).each do |order_attributes|
          collection.push(Ecommerce::Resources::Order.new(order_attributes))
        end
      end
    end
  end
end

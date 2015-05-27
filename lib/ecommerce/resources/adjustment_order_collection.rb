module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce adjustments orders API.
    #
    class AdjustmentOrderCollection < Collection
      private

      def build_collection
        Ecommerce::Resources::Base.parsed_body(response).each do |adjustment_order_attributes|
          collection.push(Ecommerce::Resources::AdjustmentOrder.new(adjustment_order_attributes))
        end
      end
    end
  end
end

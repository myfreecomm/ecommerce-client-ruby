module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce orders API.
    #
    class InvoiceOrderCollection < Collection
      def orders
        collection
      end

      private

      def build_collection
        Ecommerce::Resources::Base.parsed_body(response).each do |invoice_attributes|
          collection.push(Ecommerce::Resources::InvoiceOrder.new(invoice_attributes))
        end
      end
    end
  end
end

module Ecommerce
  module Resources
    class Order < Base
      def create(slug, params)
        client.post("/api/orders/#{slug}/", { body: params }) do |response|
          parsed_body(response)
        end
      end
    end
  end
end

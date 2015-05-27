module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce adjusments orders API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #
    class AdjustmentOrder < Base
      attr_reader :amount, :description, :valid_until, :valid_from

      #
      # Creates an Adjustment order 
      #
      # [API]
      #   Method: <tt>POST /api/orders/:slug/:id/adjustments/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#criacao-de-alteracao-de-valor-para-uma-ordem-de-compra
      #
      def self.create(slug, order_id, params)
        client.post("/api/orders/#{slug}/#{order_id}/adjustments/", body: params) do |response|
          build_order(response)
        end
      end

      #
      # Lists all Orders of a slug and return a collection with orders 
      # and pagination information (represented by Ecommerce::Resources::OrderCollection)
      #
      # [API]
      #   Method: <tt>GET /api/orders/:slug/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#listagem-de-ordens-de-compra
      #
      def self.find_all(slug, order_id, page = 1, limit = 20)
        body = { page: page, limit: limit }
        client.get("/api/orders/#{slug}/#{order_id}/adjustments/", body: body) do |response|
          Ecommerce::Resources::AdjustmentOrderCollection.build(response)
        end
      end

      #
      # Finds an Order adjustment
      #
      # [API]
      #   Method: <tt>GET /api/orders/:slug/:order_id/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#detalhes-de-uma-ordem-de-compra
      #
      def self.find(slug, order_id, id)
        client.get("/api/orders/#{slug}/#{order_id}/") do |response|
          build_order(response)
        end
      end

      #
      # Destroys an Order
      #
      # [API]
      #   Method: <tt>DELETE /api/orders/:slug/:order_id/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#delete-api-orders-slug-id
      #
      def self.destroy(order_id, slug)
        client.delete("/api/orders/#{slug}/#{order_id}/") do |response|
          build_order(response)
        end
      end

      #
      # Updates an Order client information
      #
      # [API]
      #   Method: <tt>PUT /api/orders/:slug/:order_id/</tt>
      #
      #   Documentation for available and required fields: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#put-api-orders-slug-id
      #
      def self.update(order_id, slug, order_params={})
        client.put("/api/orders/#{slug}/#{order_id}/", body: order_params) do |response|
          build_order(response)
        end
      end

      private

      def self.build_order(response)
        order_attributes = parsed_body(response)
        order_attributes.empty? ? {} : new(order_attributes)
      end
    end
  end
end

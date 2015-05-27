module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce adjusments orders API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #
    class AdjustmentOrder < Base
      attr_reader :url, :amount, :description, :valid_until, :valid_from

      #
      # Adjustment order API does not return the ID field
      #
      def id
        url.split('/')[8].to_i
      end

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
          build(response)
        end
      end

      #
      # Lists all Adjustments orders of an order and return a collection
      # and pagination information (represented by Ecommerce::Resources::AdjustmentOrderCollection)
      #
      # [API]
      #   Method: <tt>GET /api/orders/:slug/adjustments/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#listagem-das-alteracoes-de-valor-associadas-a-uma-ordem-de-compra
      #
      def self.find_all(slug, order_id, page = 1, limit = 20)
        body = { page: page, limit: limit }
        client.get("/api/orders/#{slug}/#{order_id}/adjustments/", body: body) do |response|
          Ecommerce::Resources::AdjustmentOrderCollection.build(response)
        end
      end

      #
      # Finds an Adjustment order
      #
      # [API]
      #   Method: <tt>GET /api/orders/:slug/:order_id/adjustments/:id/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#obtencao-dos-dados-de-uma-alteracao-de-valor
      #
      def self.find(slug, order_id, id)
        client.get("/api/orders/#{slug}/#{order_id}/adjustments/#{id}/") do |response|
          build(response)
        end
      end

      #
      # Destroys an Adjustment order
      #
      # [API]
      #   Method: <tt>DELETE /api/orders/:slug/:order_id/adjustments/:id/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#remocao-de-uma-alteracao-de-valor
      #
      def self.destroy(order_id, slug, id)
        client.delete("/api/orders/#{slug}/#{order_id}/adjustments/#{id}/") do |response|
          build(response)
        end
      end

      def self.build(response)
        attributes = parsed_body(response)
        attributes.empty? ? {} : new(attributes)
      end
    end
  end
end

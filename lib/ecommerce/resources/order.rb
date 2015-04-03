module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce orders API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #
    class Order < Base

      attr_reader :is_paid, :address_number, :plan_change_urls, :activation_expired, :number, :is_trial,
                  :address_state, :global_account, :api_url, :document_number, :checkout_url, :active_until,
                  :charge_day, :address_quarter, :activated_at, :is_active, :user_code, :address, :is_recurring,
                  :address_city, :plan_slug, :address_complement, :discounts_url, :created_at, :adjustments_url,
                  :next_payment_at, :amount, :client_email, :client_name, :invoices_url, :zip_code

      #
      # Creates an Order
      #
      # [API]
      #   Method: <tt>POST /api/orders/:slug/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#criacao-de-ordem-de-compra
      #
      def self.create(slug, params)
        client.post("/api/orders/#{slug}/", body: params) do |response|
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
      def self.find_all(slug, page = 1, limit = 20)
        body = { page: page, limit: limit }
        client.get("/api/orders/#{slug}/", body: body) do |response|
          Ecommerce::Resources::OrderCollection.build(response)
        end
      end

      #
      # Finds an Order
      #
      # [API]
      #   Method: <tt>GET /api/orders/:slug/:order_id/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#detalhes-de-uma-ordem-de-compra
      #
      def self.find(order_id, slug)
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
        order_attributes.empty? ? {} : self.new(order_attributes)
      end
    end
  end
end

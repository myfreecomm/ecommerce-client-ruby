module Ecommerce
  module Resources

    #
    # A wrapper to Ecommerce orders invoice API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #

    class InvoiceOrder < Base

      attr_reader :redeemed_adjustments, :order_url, :url, :created_at, :activated_at, :number, :user_data,
                  :amount_with_adjustments, :amount, :paid, :payment_method, :plan_data, :charge_date, 
                  :next_payment_date
      #
      # Lists all invoice of an orders and return a collection of invoice with pagination information (represented by Ecommerce::Resources::InvoiceCollection)
      #
      # [API]
      #   Method: <tt>GET /api/accounts/:account_uuid/orders/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#listagem-das-ordens-de-compra-de-uma-conta
      #

      def self.find_all(order_id, slug, page = 1, limit = 20)
        client.get("/api/orders/#{slug}/#{order_id}/invoices/", { body: { page: page, limit: limit } }) do |response|
          Ecommerce::Resources::InvoiceOrderCollection.build(response)
        end
      end
    end
  end
end

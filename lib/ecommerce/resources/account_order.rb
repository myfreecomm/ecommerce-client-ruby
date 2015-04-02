module Ecommerce
  module Resources

    #
    # A wrapper to Ecommerce orders API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #

    class AccountOrder < Base


      #
      # Lists all Orders of an account and return a collection with orders and pagination information (represented by Ecommerce::Resources::Collection)
      #
      # [API]
      #   Method: <tt>GET /api/accounts/:account_uuid/orders/</tt>
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#listagem-das-ordens-de-compra-de-uma-conta
      #

      def self.find_all(account_uuid, page = 1, limit = 20)
        client.get("/api/accounts/#{account_uuid}/orders/", { body: { page: page, limit: limit } }) do |response|
          Ecommerce::Resources::OrderCollection.build(response)
        end
      end
    end
  end
end

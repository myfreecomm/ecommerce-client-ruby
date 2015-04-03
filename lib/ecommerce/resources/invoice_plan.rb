module Ecommerce
  module Resources
    #
    # A wrapper to Ecommerce invoice per plan API
    #
    # [API]
    #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/index.html
    #
    class InvoicePlan < Base

      #
      # Lists all paid invoices of a plan and return a collection of invoice with 
      # pagination information (represented by Ecommerce::Resources::InvoiceOrderCollection)
      #
      # [API]
      #   Method: <tt>GET /api/:slug/invoices/paid/
      #
      #   Documentation: http://myfreecomm.github.io/passaporte-web/ecommerce/api/orders.html#listagem-das-faturas-pagas-para-um-plano
      #
      def self.find_all(slug, page = 1, limit = 20)
        body = { page: page, limit: limit }
        client.get("/api/#{slug}/invoices/paid/", body: body) do |response|
          Ecommerce::Resources::InvoiceOrderCollection.build(response)
        end
      end
    end
  end
end

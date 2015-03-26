module Ecommerce
  module Resources
    class Order < Base

      attr_reader :is_paid, :address_number, :plan_change_urls, :activation_expired, :number, :is_trial,
                  :address_state, :global_account, :api_url, :document_number, :checkout_url, :active_until,
                  :charge_day, :address_quarter, :activated_at, :is_active, :user_code, :address, :is_recurring,
                  :address_city, :plan_slug, :address_complement, :discounts_url, :created_at, :adjustments_url,
                  :next_payment_at, :amount, :client_email, :client_name, :invoices_url, :zip_code

      def self.create(slug, params)
        client.post("/api/orders/#{slug}/", { body: params }) do |response|
          build_order(response)
        end
      end

      def self.find_all(slug, page = 1, limit = 20)
        client.get("/api/orders/#{slug}/", { body: {page: page, limit: limit} }) do |response|
          Ecommerce::Resources::OrderCollection.build(response)
        end
      end

      def self.find(order_id, slug)
        client.get("/api/orders/#{slug}/#{order_id}/") do |response|
          build_order(response)
        end
      end

      def self.destroy(order_id, slug)
        client.delete("/api/orders/#{slug}/#{order_id}/") do |response|
          build_order(response)
        end
      end

      def destroy
        self.class.destroy(number, plan_slug)
      end

      private

      def self.build_order(response)
        order_attributes = parsed_body(response)
        order_attributes.empty? ? {} : self.new(order_attributes)
      end
    end
  end
end

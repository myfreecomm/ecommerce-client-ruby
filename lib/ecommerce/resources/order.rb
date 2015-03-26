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
          order_attributes = parsed_body(response)
          build_order(order_attributes)
        end
      end

      private

      def self.build_order(attributes)
        self.new(attributes)
      end
    end
  end
end

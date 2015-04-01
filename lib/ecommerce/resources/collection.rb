module Ecommerce
  module Resources

    #
    # A wrapper to Ecommerce orders API. This wrapper represents a collection of orders and it's responsible for processing pagination information as well.
    #

    class Collection < Base

      PAGE_REGEX = /page=(\d+)/

      attr_reader :response, :orders, :headers

      def initialize(response)
        @response = response
        @orders = []
        @headers = response.headers['Link'].split(',')
      end

      def self.build(response)
        self.new(response).build
      end

      def build
        build_orders
        self
      end

      def next_page
        page_for(:next)
      end

      def last_page
        page_for(:last)
      end

      def previous_page
        page_for(:prev)
      end

      def first_page
        page_for(:first)
      end

      private

      def page_for(page_rel)
        header_link_for(page_rel).match(PAGE_REGEX)[1].to_i rescue nil
      end

      def header_link_for(rel)
        headers.select{|n| n =~ /rel=#{rel}/}.first
      end

      def build_orders
        Ecommerce::Resources::Base.parsed_body(response).each do |order_attributes|
          orders.push(Ecommerce::Resources::Order.new(order_attributes))
        end
      end
    end
  end
end

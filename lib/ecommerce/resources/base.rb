module Ecommerce
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def parsed_body(response)
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
      end
    end
  end
end

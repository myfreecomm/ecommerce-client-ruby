module Ecommerce
  module Resources
    class Base

      def initialize(attribute={})
        attribute.each do |k, v|
          set_attribute(k, v)
        end
      end

      def self.client
        Ecommerce.client
      end

      private

      def self.parsed_body(response)
        MultiJson.load(response.body)
      rescue MultiJson::ParseError
        {}
      end

      def set_attribute(key, value)
        object_value = Ecommerce::AttributeHandler.handle(value)
        instance_variable_set("@#{key}", object_value)
      end
    end
  end
end

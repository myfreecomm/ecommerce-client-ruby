require 'bigdecimal'

module Ecommerce
  class AttributeHandler

    KINDS = [:decimal, :date, :datetime]

    attr_reader :attribute

    def initialize(attribute)
      @attribute = attribute
    end

    def self.handle(attribute)
      self.new(attribute).handle
    end

    def handle
      KINDS.each do |kind|
        return send("as_#{kind}") if send("is_#{kind}?")
      end
      attribute
    end

    private

    def is_decimal?
      attribute =~ /\A\d+\.\d+\Z/
    end

    def is_date?
      attribute =~ /\A\d+{4}\-\d+{2}\-\d+{2}\Z/
    end

    def is_datetime?
      attribute =~ /\A\d+{4}\-\d+{2}\-\d+{2}[T ]?\d+{2}\:\d+{2}\:\d+{2}[Z]?\Z/
    end

    def as_decimal
      BigDecimal.new(attribute)
    end

    def as_date
      Date.parse(attribute)
    end

    def as_datetime
      DateTime.parse(attribute)
    end
  end
end
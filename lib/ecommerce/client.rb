module Ecommerce
  class Client
    attr_reader :http

    def initialize(token, secret)
      @http = Http.new(token, secret)
    end

    def authenticated?
      http.get("") do |response|
        response.code == 200
      end
    rescue RequestError => e
      raise e unless e.code == 401
      false
    end
  end
end

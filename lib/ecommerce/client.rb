require "ecommerce/request"
require "ecommerce/response"

module Ecommerce
  class Client
    attr_reader :token, :secret

    def initialize(token, secret)
      @token = token
      @secret = secret
    end

    def authenticated?(plan)
      get("/api/orders/#{plan}/") { |response| response.code == 200 }
    rescue RequestError => e
      raise e unless [401, 403].include?(e.code)
      false
    end

    %w[get post delete put patch].each do |m|
      define_method(m) do |path, options = {}, &block|
        send_request(m.to_sym, path, options, &block)
      end
    end

    private

    def send_request(method, path, options, &block)
      request  = Request.new(options.merge!({
        method: method,
        authorization_hash: authorization_hash,
        url: "#{Ecommerce.configuration.url}#{path}",
        user_agent: Ecommerce.configuration.user_agent
      }))

      response = Response.new(request.run)

      response.resolve!(&block)
    end

    def authorization_hash
      ::Base64.strict_encode64("#{token}:#{secret}")
    end
  end
end

require "base64"

module Ecommerce
  class Configuration
    attr_accessor :url, :user_agent, :token, :secret

    def initialize
      @url = "https://ecommerce.myfreecomm.com.br"
      @user_agent = "Ecommerce Ruby Client v#{Ecommerce::VERSION}"
      @token = nil
      @secret = nil
    end
  end
end

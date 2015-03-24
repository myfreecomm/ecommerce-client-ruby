require "base64"

module Ecommerce
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = "https://ecommerce.myfreecomm.com.br"
      @user_agent = "Ecommerce Ruby Client v#{Ecommerce::VERSION}"
    end
  end
end

require "ecommerce"
require "pry"
require "vcr"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

Dir["spec/support/**/*.rb"].each { |f| load f }

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :typhoeus
  config.ignore_hosts "codeclimate.com"
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    Ecommerce.configuration.url = "http://sandbox.ecommerce.myfreecomm.com.br"
    Ecommerce.configuration.secret = "41e13768b47d553417b441b863ba"
    Ecommerce.configuration.token = "p9aYsRSIvM"
    Typhoeus::Expectation.clear
  end
end

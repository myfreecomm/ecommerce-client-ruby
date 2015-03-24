require "ecommerce"
require "pry"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :typhoeus
  config.ignore_hosts "codeclimate.com"
end

RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    Ecommerce.configuration.url = "https://sandbox.ecommerce.myfreecomm.com.br"
    Typhoeus::Expectation.clear
  end
end

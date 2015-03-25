require "spec_helper"

describe Ecommerce::Request do
  describe "#run" do
    subject { described_class.new({ method: 'post', params: {}, url: Ecommerce.configuration.url, user_agent: 'My Test User-Agent', authorization_hash: 'my-auth-hash' }) }

    it "does a request using Typhoeus::Request" do
      expect(Typhoeus::Request).to receive(:new).with("http://sandbox.ecommerce.myfreecomm.com.br", { method: "post", params: {}, headers: { "Accept" => "application/json", "Content-Type" => "application/json", "User-Agent" => "My Test User-Agent", "Authorization" => "Basic my-auth-hash" }, accept_encoding: "gzip" }).and_return(double(run: true, response: true))
      subject.run
    end

    it "invokes Typhoeus::Request#run" do
      expect_any_instance_of(Typhoeus::Request).to receive(:run)
      subject.run
    end

    it "invokes Typhoeus::Request#response" do
      allow_any_instance_of(Typhoeus::Request).to receive(:run)
      expect_any_instance_of(Typhoeus::Request).to receive(:response)
      subject.run
    end
  end
end

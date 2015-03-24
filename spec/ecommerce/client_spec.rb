require "spec_helper"

describe Ecommerce::Client do
  let(:token) { "7RW31GX4VT" }
  let(:secret) { "4da115bd0b9ef3892d114f37f360119871f5fc010fe2a56e69a4608218a7f0de2b988854af5add96c21b0bb5c0579b593763ec698e2c2592fa52e7458b4654ac" }
  subject     { described_class.new(token, secret) }

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") do
          expect(subject.authenticated?).to be_truthy
        end
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN", "FAKE-SECRET") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") do
          expect(subject.authenticated?).to be_falsey
        end
      end
    end
  end
end

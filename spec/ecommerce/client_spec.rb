require "spec_helper"

describe Ecommerce::Client do

  describe "#authenticated?" do
    context "with a valid token" do
      subject { described_class.new(Ecommerce.configuration.token, Ecommerce.configuration.secret) }

      it "returns true" do
        VCR.use_cassette("client/authenticated/true") do
          expect(subject.authenticated?('rexpense-custom-monthly-brl-5250')).to be_truthy
        end
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN", "FAKE-SECRET") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") do
          expect(subject.authenticated?('rexpense-custom-monthly-brl-5250')).to be_falsey
        end
      end
    end
  end
end

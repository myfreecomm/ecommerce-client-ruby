require "spec_helper"

describe Ecommerce do
  it "has a version number" do
    expect(Ecommerce::VERSION).not_to be_nil
  end

  describe ".configuration" do
    it "is done via block initialization" do
      Ecommerce.configure do |c|
        c.url = "http://some/where"
        c.user_agent = "My App v1.0"
      end
      expect(Ecommerce.configuration.url).to eq "http://some/where"
      expect(Ecommerce.configuration.user_agent).to eq "My App v1.0"
    end

    it "uses a singleton object for the configuration values" do
      config1 = Ecommerce.configuration
      config2 = Ecommerce.configuration
      expect(config1).to eq config2
    end
  end

  describe ".configure" do
    it "returns nil when no block given" do
      expect(Ecommerce.configure).to eql(nil)
    end

    it "raise error if no method" do
      expect { Ecommerce.configure do |c|
        c.user = "Bart"
      end }.to raise_error(NoMethodError)
    end
  end

  describe ".client" do
    subject { described_class.client("MYTOKEN", "MYSECRET") }

    it "returns an instance of Ecommerce::Client" do
      expect(subject).to be_a(Ecommerce::Client)
    end
  end
end

require "spec_helper"

describe Ecommerce::Configuration do

  it "uses the production Ecommerce URL by default" do
    expect(subject.url).to eq "https://ecommerce.myfreecomm.com.br"
  end

  it "uses a default user agent" do
    expect(subject.user_agent).to eq "Ecommerce Ruby Client v#{Ecommerce::VERSION}"
  end

  it "uses ecommerce token as nil by default" do
    expect(subject.token).to be_nil
  end

  it "uses ecommerce secret as nil by default" do
    expect(subject.secret).to be_nil
  end

end

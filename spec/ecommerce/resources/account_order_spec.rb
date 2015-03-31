require "spec_helper"

describe Ecommerce::Resources::AccountOrder do
  describe '.find_all', vcr: true do
    context 'when success' do
      subject { described_class.find_all('e5732007-7989-4372-8e72-9ec8cf6ee046') }

      it 'returns a find_all of orders' do
        expect(subject.class).to eq(Ecommerce::Resources::Collection)
        expect(subject.orders.first.plan_slug).to eq("rexpense-custom-monthly-brl-5250")
        expect(subject.orders.first.class).to eq(Ecommerce::Resources::Order)
        expect(subject.orders.count).to eq(20)
      end
    end

    context 'when not found' do
      subject { described_class.find_all('wrong-account-uuid') }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

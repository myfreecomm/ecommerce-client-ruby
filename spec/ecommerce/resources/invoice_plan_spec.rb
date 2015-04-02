require 'spec_helper'

describe Ecommerce::Resources::InvoicePlan do
  describe '.find_all', vcr: true do
    context 'when success' do
      subject { described_class.find_all('rexpense-custom-monthly-brl-5250') }

      it 'returns a find_all of orders' do
        expect(subject.class).to eq(Ecommerce::Resources::InvoiceOrderCollection)
        expect(subject.orders.first.class).to eq(Ecommerce::Resources::InvoiceOrder)
        expect(subject.orders.count).to eq(1)
      end
    end

    context 'when not found' do
      subject { described_class.find_all(2704, 'wrong-slug') }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

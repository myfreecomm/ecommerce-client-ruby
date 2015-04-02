require "spec_helper"

describe Ecommerce::Resources::InvoiceOrder do
  describe '.find_all', vcr: true do
    context 'when success' do
      subject { described_class.find_all(2704, 'rexpense-custom-monthly-brl-5250') }

      it 'returns a find_all of orders' do
        expect(subject.class).to eq(Ecommerce::Resources::InvoiceOrderCollection)
        expect(subject.orders.first.class).to eq(Ecommerce::Resources::InvoiceOrder)
        expect(subject.orders.count).to eq(2)
      end
    end

    context 'when not found' do
      subject { described_class.find_all(2704, 'wrong-slug') }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end

  describe '.find', vcr: true do
    context 'when success' do
      subject { described_class.find(2544, 2704, 'rexpense-custom-monthly-brl-5250') }

      it 'returns order object' do
        expect(subject.redeemed_adjustments).to eq([])
        expect(subject.order_url).to eq('http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/')
        expect(subject.url).to eq('http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/invoices/2544/')
        expect(subject.created_at).to eq(DateTime.new(2015, 4, 2, 15, 27, 55))
        expect(subject.activated_at).to eq(DateTime.new(2015, 4, 2, 15, 28, 49))
        expect(subject.number).to eq(2544)
        expect(subject.user_data).to eq({"address_city"=>"RJ", "address_complement"=>"41", "address_number"=>"41", "address_quarter"=>"Bla", "client_name"=>"Teste", "address_state"=>"RJ", "client_email"=>"jaime.lannister@mailinator.com", "address"=>"Rua sem numero", "document_number"=>"05793832000126", "zip_code"=>"20231030"})
        expect(subject.amount_with_adjustments).to eq(52.0)
        expect(subject.amount).to eq(52.0)
        expect(subject.paid).to be_nil
        expect(subject.payment_method).to eq('buypage :: visa')
        expect(subject.plan_data).to eq({"slug"=>"rexpense-custom-monthly-brl-5250", "name"=>"rexpense-custom-monthly-brl-5250", "description"=>"Rexpense monthly for 5 users (10,50 BRL each)"})
        expect(subject.charge_date).to eq(Date.new(2015, 4, 2))
        expect(subject.next_payment_date).to eq(Date.new(2015, 5, 2))
      end
    end

    context 'when not found' do
      subject { described_class.find(2544, 2704, 'wrong-slug') }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

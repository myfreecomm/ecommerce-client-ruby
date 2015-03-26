require "spec_helper"

describe Ecommerce::Resources::Order do
  describe '.create', vcr: true do
    let(:params) { { global_account: 'e5732007-7989-4372-8e72-9ec8cf6ee046',
                     client_email: 'jaime.lannister@mailinator.com',
                     identity: '8923199e-6c43-415a-bbd1-2e302fdf8d96' } }

    subject { described_class.create('rexpense-custom-monthly-brl-5250', params) }

    context 'when success' do
      it 'returns body' do
        expect(subject.is_paid).to be_falsy
        expect(subject.address_number).to be_nil
        expect(subject.plan_change_urls).to eq({})
        expect(subject.activation_expired).to be_falsy
        expect(subject.number).to eq(2609)
        expect(subject.address_state).to be_nil
        expect(subject.global_account).to eq('e5732007-7989-4372-8e72-9ec8cf6ee046')
        expect(subject.api_url).to eq("http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/")
        expect(subject.is_trial).to be_falsy
        expect(subject.document_number).to be_nil
        expect(subject.checkout_url).to eq("http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2609/checkout/")
        expect(subject.active_until).to be_nil
        expect(subject.charge_day).to eq(25)
        expect(subject.address_quarter).to be_nil
        expect(subject.activated_at).to be_nil
        expect(subject.is_active).to be_falsy
        expect(subject.user_code).to be_empty
        expect(subject.address).to be_nil
        expect(subject.is_recurring).to be_truthy
        expect(subject.address_city).to be_nil
        expect(subject.plan_slug).to eq("rexpense-custom-monthly-brl-5250")
        expect(subject.address_complement).to be_nil
        expect(subject.discounts_url).to eq("http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/discounts/")
        expect(subject.created_at).to eq(DateTime.new(2015, 3, 25, 17, 55, 32))
        expect(subject.adjustments_url).to eq("http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/adjustments/")
        expect(subject.next_payment_at).to be_nil
        expect(subject.amount).to eq(52.5)
        expect(subject.client_email).to eq("jaime.lannister@mailinator.com")
        expect(subject.zip_code).to be_nil
        expect(subject.client_name).to be_empty
        expect(subject.invoices_url).to eq("http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/invoices/")
      end

      context 'when sending not all required parameters' do
        before { params.delete(:global_account) }

        it 'raises error BarRequest' do
          expect{subject}.to raise_error(Ecommerce::RequestError)
        end
      end
    end
  end

  describe '.list', vcr: true do
    let(:params) { { global_account: 'e5732007-7989-4372-8e72-9ec8cf6ee046',
                     client_email: 'jaime.lannister@mailinator.com',
                     identity: '8923199e-6c43-415a-bbd1-2e302fdf8d96' } }

    context 'when success' do
      subject { described_class.list('rexpense-custom-monthly-brl-5250') }

      it 'returns a list of orders' do
        expect(subject.class).to eq(Ecommerce::Resources::OrderCollection)
        expect(subject.orders.first.plan_slug).to eq("rexpense-custom-monthly-brl-5250")
        expect(subject.orders.first.class).to eq(Ecommerce::Resources::Order)
        expect(subject.orders.count).to eq(4)
      end
    end

    context 'when not found' do
      subject { described_class.list('wrong-slug') }

      it 'raises NotFound' do
        expect{subject}.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

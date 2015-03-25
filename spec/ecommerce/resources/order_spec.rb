require "spec_helper"

describe Ecommerce::Resources::Order do
  describe '#create', vcr: true do
    let(:params) { { global_account: 'e5732007-7989-4372-8e72-9ec8cf6ee046',
                     client_email: 'jaime.lannister@mailinator.com',
                     identity: '8923199e-6c43-415a-bbd1-2e302fdf8d96' } }

    subject { described_class.new(Ecommerce.client).create('rexpense-custom-monthly-brl-5250', params) }

    context 'when success' do
      it 'returns body' do
        expect(subject).to eq({"is_paid"=>false, "address_number"=>nil, "plan_change_urls"=>{}, "activation_expired"=>false, "number"=>2609, "address_state"=>nil, "global_account"=>"e5732007-7989-4372-8e72-9ec8cf6ee046", "api_url"=>"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/", "is_trial"=>false, "document_number"=>nil, "checkout_url"=>"http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2609/checkout/", "active_until"=>nil, "charge_day"=>25, "address_quarter"=>nil, "activated_at"=>nil, "is_active"=>false, "user_code"=>"", "address"=>nil, "is_recurring"=>true, "address_city"=>nil, "plan_slug"=>"rexpense-custom-monthly-brl-5250", "address_complement"=>nil, "discounts_url"=>"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/discounts/", "created_at"=>"2015-03-25 17:55:32", "adjustments_url"=>"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/adjustments/", "next_payment_at"=>nil, "amount"=>"52.50", "client_email"=>"jaime.lannister@mailinator.com", "zip_code"=>nil, "client_name"=>"", "invoices_url"=>"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/invoices/"})
      end

      context 'when sending not all required parameters' do
        before { params.delete(:global_account) }

        it 'raises error BarRequest' do
          expect{subject}.to raise_error(Ecommerce::RequestError)
        end
      end
    end
  end
end

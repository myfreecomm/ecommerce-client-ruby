require 'spec_helper'

describe Ecommerce::Resources::InvoiceOrderCollection do
    let(:response) { double(headers: {"Link" => "<http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=3>; rel=next, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=1>; rel=prev, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=3>; rel=last, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=1>; rel=first"},
                          body: "[{\"redeemed_adjustments\":[],\"order_url\":\"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/\",\"url\":\"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/invoices/2544/\",\"created_at\":\"2015-04-02 15:27:55\",\"activated_at\":\"2015-04-02 15:28:49\",\"number\":2544,\"user_data\":{\"address_city\":\"RJ\",\"address_complement\":\"41\",\"address_number\":\"41\",\"address_quarter\":\"Bla\",\"client_name\":\"Teste\",\"address_state\":\"RJ\",\"client_email\":\"jaime.lannister@mailinator.com\",\"address\":\"Ruasemnumero\",\"document_number\":\"05793832000126\",\"zip_code\":\"20231030\"},\"amount_with_adjustments\":\"52.00\",\"amount\":\"52.00\",\"paid_at\":\"2015-04-02 15:28:45\",\"payment_method\":\"buypage::visa\",\"plan_data\":{\"slug\":\"rexpense-custom-monthly-brl-5250\",\"name\":\"rexpense-custom-monthly-brl-5250\",\"description\":\"Rexpensemonthlyfor5users(10,50BRLeach)\"},\"charge_date\":\"2015-04-02\",\"next_payment_date\":\"2015-05-02\"},{\"redeemed_adjustments\":[],\"order_url\":\"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/\",\"url\":\"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2704/invoices/2545/\",\"created_at\":\"2015-04-02 15:28:49\",\"activated_at\":null,\"number\":2545,\"user_data\":{\"address_city\":\"RJ\",\"address_complement\":\"41\",\"address_number\":\"41\",\"address_quarter\":\"Bla\",\"client_name\":\"Teste\",\"address_state\":\"RJ\",\"client_email\":\"jaime.lannister@mailinator.com\",\"address\":\"Ruasemnumero\",\"document_number\":\"05793832000126\",\"zip_code\":\"20231030\"},\"amount_with_adjustments\":\"52.00\",\"amount\":\"52.00\",\"paid_at\":null,\"payment_method\":\"buypage::visa\",\"plan_data\":{\"slug\":\"rexpense-custom-monthly-brl-5250\",\"name\":\"rexpense-custom-monthly-brl-5250\",\"description\":\"Rexpensemonthlyfor5users(10,50BRLeach)\"},\"charge_date\":\"2015-05-02\",\"next_payment_date\":\"2015-06-02\"}]") }

  subject { described_class.new(response) }

  describe '#build' do
    it 'returns order collection' do
      expect(subject.build.class).to eq(Ecommerce::Resources::InvoiceOrderCollection)
    end

    it "returns orders" do
      orders = subject.build.orders
      expect(orders.count).to eq(2)
      expect(orders.first.class).to eq(Ecommerce::Resources::InvoiceOrder)
    end
  end
end

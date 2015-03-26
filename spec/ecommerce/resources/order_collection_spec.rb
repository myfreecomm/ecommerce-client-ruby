require "spec_helper"

describe Ecommerce::Resources::OrderCollection do
  let(:response) { double(headers: {"Link" => "<http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=3>; rel=next, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=1>; rel=prev, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=3>; rel=last, <http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/?page=1>; rel=first"},
                          body: "[{\"is_paid\": false, \"address_number\": null, \"plan_change_urls\": {}, \"activation_expired\": false, \"number\": 2608, \"address_state\": null, \"global_account\": \"e5732007-7989-4372-8e72-9ec8cf6ee046\", \"api_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2608/\", \"is_trial\": false, \"document_number\": null, \"checkout_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2608/checkout/\", \"active_until\": null, \"charge_day\": 25, \"address_quarter\": null, \"activated_at\": null, \"is_active\": false, \"user_code\": \"\", \"address\": null, \"is_recurring\": true, \"address_city\": null, \"plan_slug\": \"rexpense-custom-monthly-brl-5250\", \"address_complement\": null, \"discounts_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2608/discounts/\", \"created_at\": \"2015-03-25 17:54:42\", \"adjustments_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2608/adjustments/\", \"next_payment_at\": null, \"amount\": \"52.50\", \"client_email\": \"jaime.lannister@mailinator.com\", \"zip_code\": null, \"client_name\": \"\", \"invoices_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2608/invoices/\"}, {\"is_paid\": false, \"address_number\": null, \"plan_change_urls\": {}, \"activation_expired\": false, \"number\": 2609, \"address_state\": null, \"global_account\": \"e5732007-7989-4372-8e72-9ec8cf6ee046\", \"api_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/\", \"is_trial\": false, \"document_number\": null, \"checkout_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2609/checkout/\", \"active_until\": null, \"charge_day\": 25, \"address_quarter\": null, \"activated_at\": null, \"is_active\": false, \"user_code\": \"\", \"address\": null, \"is_recurring\": true, \"address_city\": null, \"plan_slug\": \"rexpense-custom-monthly-brl-5250\", \"address_complement\": null, \"discounts_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/discounts/\", \"created_at\": \"2015-03-25 17:55:32\", \"adjustments_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/adjustments/\", \"next_payment_at\": null, \"amount\": \"52.50\", \"client_email\": \"jaime.lannister@mailinator.com\", \"zip_code\": null, \"client_name\": \"\", \"invoices_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2609/invoices/\"}, {\"is_paid\": false, \"address_number\": null, \"plan_change_urls\": {}, \"activation_expired\": false, \"number\": 2610, \"address_state\": null, \"global_account\": \"e5732007-7989-4372-8e72-9ec8cf6ee046\", \"api_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2610/\", \"is_trial\": false, \"document_number\": null, \"checkout_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2610/checkout/\", \"active_until\": null, \"charge_day\": 25, \"address_quarter\": null, \"activated_at\": null, \"is_active\": false, \"user_code\": \"\", \"address\": null, \"is_recurring\": true, \"address_city\": null, \"plan_slug\": \"rexpense-custom-monthly-brl-5250\", \"address_complement\": null, \"discounts_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2610/discounts/\", \"created_at\": \"2015-03-25 17:59:15\", \"adjustments_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2610/adjustments/\", \"next_payment_at\": null, \"amount\": \"52.50\", \"client_email\": \"jaime.lannister@mailinator.com\", \"zip_code\": null, \"client_name\": \"\", \"invoices_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2610/invoices/\"}, {\"is_paid\": false, \"address_number\": null, \"plan_change_urls\": {}, \"activation_expired\": false, \"number\": 2611, \"address_state\": null, \"global_account\": \"e5732007-7989-4372-8e72-9ec8cf6ee046\", \"api_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2611/\", \"is_trial\": false, \"document_number\": null, \"checkout_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/rexpense-custom-monthly-brl-5250/2611/checkout/\", \"active_until\": null, \"charge_day\": 25, \"address_quarter\": null, \"activated_at\": null, \"is_active\": false, \"user_code\": \"\", \"address\": null, \"is_recurring\": true, \"address_city\": null, \"plan_slug\": \"rexpense-custom-monthly-brl-5250\", \"address_complement\": null, \"discounts_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2611/discounts/\", \"created_at\": \"2015-03-25 18:03:33\", \"adjustments_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2611/adjustments/\", \"next_payment_at\": null, \"amount\": \"52.50\", \"client_email\": \"jaime.lannister@mailinator.com\", \"zip_code\": null, \"client_name\": \"\", \"invoices_url\": \"http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/2611/invoices/\"}]") }

  subject { described_class.new(response) }

  describe '#build' do
    it 'builds orders' do
      expect(subject).to receive(:build_orders)
      subject.build
    end

    it 'returns Ecommerce::Resources::OrderCollection object' do
      expect(subject.build.class).to eq(Ecommerce::Resources::OrderCollection)
    end
  end

  describe '#build_orders' do
    it 'builds an array of Ecommerce::Resources::Order' do
      expect(Ecommerce::Resources::Order).to receive(:new).exactly(4).times
      subject.build
    end
  end

  describe '#next_page' do
    it 'returns next page (3)' do
      expect(subject.next_page).to eq(3)
    end

    context 'when there is no next page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.next_page).to be_nil
      end
    end
  end

  describe '#last_page' do
    it 'returns last page (3)' do
      expect(subject.last_page).to eq(3)
    end

    context 'when there is no last page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.last_page).to be_nil
      end
    end
  end

  describe '#previous_page' do
    it 'returns previous page (3)' do
      expect(subject.previous_page).to eq(1)
    end

    context 'when there is no previous page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.previous_page).to be_nil
      end
    end
  end

  describe '#first_page' do
    it 'returns first page (3)' do
      expect(subject.first_page).to eq(1)
    end

    context 'when there is no first page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.first_page).to be_nil
      end
    end
  end
end

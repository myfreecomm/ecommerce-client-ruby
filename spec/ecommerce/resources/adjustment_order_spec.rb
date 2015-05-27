require "spec_helper"

describe Ecommerce::Resources::AdjustmentOrder do
  describe '.create', vcr: true do
    let(:params) { { amount: 50.60, description: 'New promotion', valid_from: '2015-05-27', valid_until: '2015-06-27' } }
    subject { described_class.create('rexpense-custom-monthly-brl-5250', 3001, params) }

    context 'when success' do
      it 'returns adjustment created body' do
        expect(subject.amount).to eq(50.6)
        expect(subject.description).to eq('New promotion')
        expect(subject.valid_from).to eq(Date.new(2015, 5, 27))
        expect(subject.valid_until).to eq(Date.new(2015, 6, 27))
      end

      context 'when sending not all required parameters' do
        before { params.delete(:amount) }

        it 'raises error RequestError' do
          expect{subject}.to raise_error(Ecommerce::RequestError)
        end
      end
    end
  end

  describe '.find_all', vcr: true do
    context 'when success' do
      subject { described_class.find_all('rexpense-custom-monthly-brl-5250', 3001) }

      it 'returns a find_all of orders' do
        expect(subject.class).to eq(Ecommerce::Resources::AdjustmentOrderCollection)
        expect(subject.collection.first.description).to eq('New promotion')
        expect(subject.collection.first.url).to eq('http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/3001/adjustments/201/')
        expect(subject.collection.first.amount).to eq(50.6)
        expect(subject.collection.first.class).to eq(Ecommerce::Resources::AdjustmentOrder)
        expect(subject.collection.count).to eq(1)
      end
    end

    context 'when not found' do
      subject { described_class.find_all('wrong-slug', 3001) }

      it 'raises RequestError' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end

  describe '.find', vcr: true do
    context 'when success' do
      subject { described_class.find('rexpense-custom-monthly-brl-5250', 3001, 201) }

      it 'returns adjustment order object' do
        expect(subject.amount).to eq(50.6)
        expect(subject.description).to eq('New promotion')
        expect(subject.valid_from).to eq(Date.new(2015, 5, 27))
        expect(subject.valid_until).to eq(Date.new(2015, 6, 27))
        expect(subject.url).to eq('http://sandbox.ecommerce.myfreecomm.com.br/api/orders/rexpense-custom-monthly-brl-5250/3001/adjustments/201/')
        expect(subject.id).to eq(201)
      end
    end

    context 'when not found' do
      subject { described_class.find('wrong-slug', 3001, 201) }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end

  describe '.destroy', vcr: true do
    context 'when success' do
      subject { described_class.destroy(3001, 'rexpense-custom-monthly-brl-5250', 201) }

      it 'returns empty body' do
        expect(subject).to be_empty
      end
    end

    context 'when not found' do
      subject { described_class.destroy(3001, 'wrong-slug', 201) }

      it 'raises NotFound' do
        expect{ subject }.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

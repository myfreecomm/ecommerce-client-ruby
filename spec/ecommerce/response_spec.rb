require "spec_helper"

describe Ecommerce::Response do
  subject { described_class.new }

  describe "#resolve!" do
    context 'when success' do
      it 'returns self' do
        response = double(success?: true)
        expect(described_class.new(response).resolve!).to eq(response)
      end

      context 'when block given' do
        it 'returns block' do
          response = double(success?: true)
          expect(described_class.new(response).resolve!{ response }).to eq(response)
        end
      end
    end

    context 'when timeout' do
      it 'raises RequestTimeout' do
        response = double(success?: false, timed_out?: true)
        expect{described_class.new(response).resolve!}.to raise_error(Ecommerce::RequestTimeout)
      end
    end

    context 'when not success neither timeout' do
      it 'raises RequestError' do
        response = double(success?: false, timed_out?: false, code: 301, status_message: 'Moved Permanently', body: '')
        expect{described_class.new(response).resolve!}.to raise_error(Ecommerce::RequestError)
      end
    end
  end
end

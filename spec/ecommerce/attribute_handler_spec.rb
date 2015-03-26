require "spec_helper"

describe Ecommerce::AttributeHandler do
  describe '.handle' do
    it 'instantiates a new Ecommerce::AttributeHandler' do
      expect(Ecommerce::AttributeHandler).to receive(:new).and_return(double(handle: ''))
      Ecommerce::AttributeHandler.handle('')
    end
  end

  describe '#handle' do
    context 'when attribute is a decimal' do
      subject { Ecommerce::AttributeHandler.new('1366.99') }

      it 'returns a BigDecimal object' do
        expect(subject.handle).to eq(BigDecimal.new('1366.99'))
      end
    end

    context 'when attribute is a date in ISO8601 format' do
      subject { Ecommerce::AttributeHandler.new('2015-03-26') }

      it 'returns a Date object' do
        expect(subject.handle).to eq(Date.new(2015, 3, 26))
      end
    end

    context 'when attribute is a datetime in ISO8601 format' do
      context 'when datetime has the format with date and hours separated' do
        subject { Ecommerce::AttributeHandler.new('2015-03-26 11:11:46') }

        it 'returns a Date object' do
          expect(subject.handle).to eq(DateTime.new(2015, 3, 26, 11, 11, 46))
        end
      end

      context 'when datetime has the format with date and hours separated, in UTC' do
        subject { Ecommerce::AttributeHandler.new('2015-03-26 11:11:46Z') }

        it 'returns a Date object' do
          expect(subject.handle).to eq(DateTime.new(2015, 3, 26, 11, 11, 46))
        end
      end

      context 'when datetime has the format with date and hours combined, in UTC ' do
        subject { Ecommerce::AttributeHandler.new('2014-06-01T14:17:56Z') }

        it 'returns a Date object' do
          expect(subject.handle).to eq(DateTime.new(2014, 6, 1, 14, 17, 56))
        end
      end
    end
  end
end

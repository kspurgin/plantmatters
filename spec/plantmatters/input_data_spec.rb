# frozen_string_literal: true

RSpec.describe Plantmatters::InputData do
  context 'when there is no binomial column' do
    it 'raises MissingNameColumnError' do
      file = 'spec/fixtures/files/csv/no_binomial.csv'
      expect { described_class.new(file, 'Binomial') }.to raise_error(PM::InputData::MissingNameColumnError)
    end
  end

  file = 'spec/fixtures/files/csv/capitalized_headers.csv'
  let(:capped) { described_class.new(file, 'Binomial') }

  describe '#headers' do
    context 'given CSV columns with capital letters' do
      it 'returns downcased headers' do
        expect(capped.headers.join(' ')).to eq('binomial foo')
      end
    end
  end

  describe '#names' do
    it 'returns alphabetized array of unique binomial values with extra spaces stripped' do
      expect(capped.names).to eq(%w[Aaa bar])
    end
  end
end

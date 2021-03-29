# frozen_string_literal: true

RSpec.describe Plantmatters::GBIF::Classification do
  let(:data) do
    {
      phylum: 'p',
      class: 'c',
      order: 'o',
      family: 'f',
      genus: 'g',
      species: 's'
    }
  end
  let(:classed) { described_class.new(data) }

  describe '#to_h' do
    it 'returns hash of classification data' do
      expect(classed.to_h).to eq(data)
    end
  end

  describe '#to_s' do
    it 'returns string indicating hierarchy' do
      expect(classed.to_s).to eq('p > c > o > f > g > s')
    end
  end
end

# frozen_string_literal: true

RSpec.describe Plantmatters::Name do
  let(:cultivar_mix) { described_class.new("Nigella damascena 'Miss Jekyll' mix") }
  let(:species) { described_class.new('Nigella damascena') }
  let(:genus_not_mix) { described_class.new('Amix damascena') }
  let(:mix_from) { described_class.new('Genus species mix from source') }

  describe '#binomial' do
    it 'returns first two words of name' do
      expect(cultivar_mix.binomial).to eq('Nigella damascena')
    end
  end

  describe '#cultivar' do
    context 'when there is text between single quotes in name' do
      it 'returns cultivar, with the single quotes' do
        expect(cultivar_mix.cultivar).to eq("'Miss Jekyll'")
      end
    end
    context 'when there is NO text between single quotes in name' do
      it 'returns empty string' do
        expect(species.cultivar).to eq('')
      end
    end
  end

  describe '#mix?' do
    context 'when name indicates a plant mix' do
      it 'returns true' do
        res = [cultivar_mix, mix_from].map(&:mix?).uniq
        expect(res).to eq([true])
      end
    end
    context 'when name does not indicate a plant mix' do
      it 'returns false' do
        res = [species, genus_not_mix].map(&:mix?).uniq
        expect(res).to eq([false])
      end
    end
  end
end

# frozen_string_literal: true

RSpec.describe Plantmatters::GBIF::SpeciesMatches do

  let(:matches) { described_class.new(name: binomial) }
  cc_vcr_opt = {cassette_name: 'matches_cercis_canadensis'}
  as_vcr_opt = {cassette_name: 'matches_andropogon_scoparius'}
  ds_vcr_opt = {cassette_name: 'matches_dicentra_spectabilis'}
  uu_vcr_opt = {cassette_name: 'matches_unknown_umbellifer'}
  
  context 'when Cercis canadensis', vcr: cc_vcr_opt do
    let(:binomial) { 'Cercis canadensis' }

    it 'returns 16 matches' do
      expect(matches.results.length).to eq(16)
    end
    it 'returns expected species key' do
      expect(matches.species_key).to eq(5353583)
    end
  end

  context 'when Andropogon scoparius', vcr: as_vcr_opt do
    let(:binomial) { 'Andropogon scoparius' }

    it 'returns 28 matches' do
      expect(matches.results.length).to eq(28)
    end

    it 'returns expected species key' do
      expect(matches.species_key).to eq(2704432)
    end
  end

  context 'when Dicentra spectabilis', vcr: ds_vcr_opt do
    let(:binomial) { 'Dicentra spectabilis' }

    it 'returns 1 match' do
      expect(matches.results.length).to eq(1)
    end
    it 'returns expected species key' do
      expect(matches.species_key).to eq(2888564)
    end
  end

  context 'when Unknown umbellifer', vcr: uu_vcr_opt do
    let(:binomial) { 'Unknown umbellifer' }

    it 'returns 0 matches' do
      expect(matches.results.length).to eq(0)
    end
    it 'returns expected species key' do
      expect(matches.species_key).to be_nil
    end
  end
end

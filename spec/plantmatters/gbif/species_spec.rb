# frozen_string_literal: true

RSpec.describe Plantmatters::GBIF::Species do
  
  let(:species) { described_class.new(searched_name: binomial, id: id) }
  
  context 'when Andropogon scoparius' do
    let(:binomial) { 'Andropogon scoparius' }
    let(:id) { 2704432 }
    let(:data) { JSON.parse(File.read('spec/fixtures/files/gbif_species/andropogon_scoparius.json')) }
    describe '.create' do
      it 'creates Species object' do
        expect(PM::GBIF::Species.create(searched_name: binomial, id: id)).to be_a(PM::GBIF::Species)
      end
    end

    describe '#data' do
      it 'is the expected parsed JSON', vcr: {cassette_name: 'species_andropogon_scoparius'} do
        expect(species.data).to eq(data)
      end
    end
  end

  context 'when Unknown umbellifer' do
    let(:binomial) { 'Unknown umbellifer' }
    let(:id) { nil }
    describe '.create' do
      it 'creates SpeciesNotFound object' do
        expect(PM::GBIF::Species.create(searched_name: binomial, id: id)).to be_a(PM::GBIF::SpeciesNotFound)
      end
    end
  end
end

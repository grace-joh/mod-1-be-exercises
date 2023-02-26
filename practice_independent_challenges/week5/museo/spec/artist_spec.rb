require 'spec_helper'

RSpec.describe Artist do
  let(:attributes) do
    { id: '2',
      name: 'Ansel Adams',
      born: '1902',
      died: '1984',
      country: 'United States' }
  end
  let(:artist) { Artist.new(attributes) }

  describe '#initialize' do
    it 'exists' do
      expect(artist).to be_a Artist
      expect(artist.id).to eq('2')
      expect(artist.name).to eq('Ansel Adams')
      expect(artist.born).to eq('1902')
      expect(artist.died).to eq('1984')
      expect(artist.country).to eq('United States')
    end
  end

  describe '#age_at_death' do
    it 'returns integer age of death' do
      expect(artist.age_at_death).to eq(82)
    end
  end
end

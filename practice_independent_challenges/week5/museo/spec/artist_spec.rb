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
end

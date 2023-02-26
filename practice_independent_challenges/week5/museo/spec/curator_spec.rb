require 'spec_helper'

RSpec.describe Curator do
  let(:curator) { Curator.new }
  let(:photo1) do
    Photograph.new({ id: '1',
                     name: 'Rue Mouffetard, Paris (Boy with Bottles)',
                     artist_id: '4',
                     year: '1954' })
  end
  let(:photo2) do
    Photograph.new({ id: '2',
                     name: 'Moonrise, Hernandez',
                     artist_id: '2',
                     year: '1941' })
  end
  let(:artist1) do
    Artist.new({ id: '1',
                 name: 'Henri Cartier-Bresson',
                 born: '1908',
                 died: '2004',
                 country: 'France' })
  end
  let(:artist2) do
    Artist.new({ id: '2',
                 name: 'Ansel Adams',
                 born: '1902',
                 died: '1984',
                 country: 'United States' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(curator).to be_a Curator
      expect(curator.photographs).to eq([])
      expect(curator.artists).to eq([])
    end
  end

  describe '#add_photograph' do
    it 'adds photo to photographs array' do
      curator.add_photograph(photo1)
      curator.add_photograph(photo2)

      expect(curator.photographs).to eq([photo1, photo2])
    end
  end

  describe '#add_artist' do
    it 'adds artist to artists array' do
      curator.add_artist(artist1)
      curator.add_artist(artist2)

      expect(curator.artists).to eq([artist1, artist2])
    end
  end
end

require 'spec_helper'

RSpec.describe Curator do
  let(:curator) { Curator.new }
  let(:photo1) do
    Photograph.new({ id: '1',
                     name: 'Rue Mouffetard, Paris (Boy with Bottles)',
                     artist_id: '1',
                     year: '1954' })
  end
  let(:photo2) do
    Photograph.new({ id: '2',
                     name: 'Moonrise, Hernandez',
                     artist_id: '2',
                     year: '1941' })
  end
  let(:photo3) do
    Photograph.new({ id: '3',
                     name: 'Monolith, The Face Of Half Dome, Yosemite Valley',
                     artist_id: '2',
                     year: '1927' })
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

  describe '#find_artist_by_id' do
    it 'finds the artist by id' do
      curator.add_artist(artist1)
      curator.add_artist(artist2)

      expect(curator.find_artist_by_id('1')).to eq(artist1)
      expect(curator.find_artist_by_id('2')).to eq(artist2)
    end
  end

  describe '#list_all_artists_with_photos' do
    it 'lists all artists with their photos' do
      curator.add_artist(artist1)
      curator.add_artist(artist2)
      curator.add_photograph(photo1)
      curator.add_photograph(photo2)
      curator.add_photograph(photo3)

      expect(curator.list_all_artists_with_photos).to eq(
        { artist1 => [photo1],
          artist2 => [photo2, photo3] }
      )
    end
  end

  describe '#list_artists_with_multiple_photos' do
    it 'lists artists with more than one photo' do
      curator.add_artist(artist1)
      curator.add_artist(artist2)
      curator.add_photograph(photo1)
      curator.add_photograph(photo2)
      curator.add_photograph(photo3)

      expect(curator.list_artists_with_multiple_photos).to eq(['Ansel Adams'])
    end
  end

  describe '#photos_by_country' do
    it 'lists photos that are taken by artist from given country' do
      curator.add_artist(artist1)
      curator.add_artist(artist2)
      curator.add_photograph(photo1)
      curator.add_photograph(photo2)
      curator.add_photograph(photo3)

      expect(curator.photos_by_country('France')).to eq([photo1])
      expect(curator.photos_by_country('United States')).to eq([photo2, photo3])
    end
  end
end

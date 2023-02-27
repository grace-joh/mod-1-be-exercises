require 'file_io'

class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def list_all_artists_with_photos
    list_all = {}
    @artists.each do |artist|
      list_all[artist] = []
      @photographs.each do |photo|
        list_all[artist] << photo if photo.artist_id == artist.id
      end
    end
    list_all
  end

  def list_artists_with_multiple_photos
    artist_list = []
    list_all_artists_with_photos.each do |artist, photos_array|
      artist_list << artist.name if photos_array.length > 1
    end
    artist_list
  end

  def photos_by_country(country)
    photo_list = []
    list_all_artists_with_photos.each do |artist, photos_array|
      photo_list << photos_array if artist.country == country
    end
    photo_list.flatten
  end

  def load_photos(file_path)
    FileIO.photos_from(file_path).each do |photo_object|
      @photographs << photo_object
    end
    @photographs
  end

  def load_artists(file_path)
    FileIO.artists_from(file_path).each do |artist_object|
      @artists << artist_object
    end
    @artists
  end
end

require 'csv'

class FileIO
  def self.photos_from(file_path)
    photos = []
    photo_data = CSV.open file_path, headers: true, header_converters: :symbol
    photo_data.each do |row|
      photo_attributes = {
        id: row[:id],
        name: row[:name],
        artist_id: row[:artist_id],
        year: row[:year]
      }
      photos << Photograph.new(photo_attributes)
    end
    photos
  end

  def self.artists_from(file_path)
    artists = []
    artist_data = CSV.open file_path, headers: true, header_converters: :symbol
    artist_data.each do |row|
      artist_attributes = {
        id: row[:id],
        name: row[:name],
        born: row[:born],
        died: row[:died],
        country: row[:country]
      }
      artists << Artist.new(artist_attributes)
    end
    artists
  end
end

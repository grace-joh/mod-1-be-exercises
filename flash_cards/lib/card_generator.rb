require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    file_text = File.open(@filename).readlines.map(&:chomp)
    # makes an array of a string of each line in the file

    cards_array = file_text.map{|string| string.split(', ')}
    # changes each string of file text array into an array of strings with question, answer, category
    
    final_array = []
    cards_array.each {|card| final_array << Card.new(card[0],card[1],card[2])}
    # takes each card array and makes a new card to push into an array of all the cards
    final_array
    
  end
end
require 'rspec'
require './lib/card_generator'
filename = "cards.txt"

RSpec.describe CardGenerator do

  describe '#initialize' do

    it 'exists' do
      card_gen = CardGenerator.new(filename)

      expect(cards).to be_an_instance_of(CardGenerator)
    end

    it 'has a file' do
      card_gen = CardGenerator.new(filename)

      expect(cards_gen.filename).to eq("cards.txt")
    end
  end

  describe '#cards' do
    
    it 'can make an array of card objects' do
      cards = CardGenerator.new(filename).cards

      expect(cards).to be_a(Array)
      expect(cards[0]).to be_an_instance_of(Card)
    end
  end
end
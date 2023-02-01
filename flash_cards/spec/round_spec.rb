require 'rspec'
require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require '../lib/round'

RSpec.describe Round do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  round = Round.new(deck)
  
  it 'exists' do
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    expect(round.turns).to eq([])
  end

  it 'has a current card' do
    expect(round.current_card).to eq(card_1)
  end

  # it 'takes a turn' do
  #   new_turn = round.take_turn("Juneau")
  #   not sure what to put in expect and eq
  #   expect(new_turn.class).to eq(Turn)
  # end

  it 'can check if take_turn guess is correct' do
    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to eq(true)
  end

  it 'has number of correct turns' do
    new_turn = round.take_turn("Juneau")

    expect(round.number_correct).to eq(1)
  end

  it '' do
    new_turn = round.take_turn("Juneau")

    expect().to eq()
  end

end

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
# deck = Deck.new(cards)
# round = Round.new(deck)
# new_turn = round.take_turn("Juneau")
# round.take_turn("Venus")

# require 'pry'; binding.pry
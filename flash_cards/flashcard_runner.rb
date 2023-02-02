# Required files
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
filename = "cards.txt"

# Round Setup
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# cards = [card_1, card_2, card_3]
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

# Start method
def start(new_round)
  puts "Welcome! You're playing with #{new_round.deck.cards.count} cards."
  puts '-------------------------------------------------'
  
  new_round.deck.cards.count.times do 
    puts "This is card number #{new_round.turns.count+1} out of #{new_round.deck.cards.count}."
    puts "#{new_round.current_card.question}"

    user_guess = gets.chomp
    turn = new_round.take_turn(user_guess)
    puts turn.feedback
  end

  puts '-------------------------------------------------'
  puts '****** Game over! ******'
  puts "You had #{new_round.number_correct} correct guesses out of #{new_round.turns.count} for a total score of #{new_round.percent_correct.round}%."
  puts "Geography - #{new_round.percent_correct_by_category("Geography").round}% correct"
  puts "STEM - #{new_round.percent_correct_by_category("STEM").round}% correct"
end

start(round)
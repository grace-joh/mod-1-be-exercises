class Round
  attr_reader :deck,
              :turns,
              :number_correct
  
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @number_correct += 1 if turn.correct?
    
    turn
  end

  def number_correct_by_category(category_arg)
    @turns.count {|turn| turn.card.category == category_arg && turn.card.answer == turn.guess}
  end

  def percent_correct
    (@number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category_arg)
    num_correct_by_cat = @turns.count {|turn| turn.card.category == category_arg && turn.card.answer == turn.guess}
    num_by_cat = @turns.count {|turn| turn.card.category == category_arg}

    (num_correct_by_cat / num_by_cat.to_f) * 100
  end
end


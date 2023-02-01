class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat_arg)
    arr_category = @cards.select {|card| card.category == cat_arg}
    arr_category
  end

end
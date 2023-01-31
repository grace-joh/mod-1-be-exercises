class Deck
  attr_accessor :array_of_cards

  def initialize(array_of_cards)
    @array_of_cards = array_of_cards
  end

  def cards
    @array_of_cards
  end

  def count
    @array_of_cards.count
  end

  def cards_in_category(cat_arg)
    arr_category = @array_of_cards.select {|card| card.category == cat_arg}
    #how to take string argument and convert to symbol?
    arr_category
  end

end
class Turn
  attr_accessor :string, :card

  #def initialize(string, card_name)
  def initialize(string, card)
    @string = string 
    #@card_name = card_name
    @card    = card
    #can i call this attribute(?) card if card is the name of the object I'm trying to use?
  end

  def guess
    @string
  end

  # def card
  #   @card_name
  # end

  def correct?
    @string == @card.answer
  end

  def feedback
    if @string == @card.answer
      "Correct!"
    else
      "Incorrect.."
    end
  end

end
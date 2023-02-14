class Bag
  attr_reader :candies
  
  def initialize
    @candies = []
  end

  def empty?
    @candies.empty?
  end

  def count
    @candies.size
  end

  def add_candy(candy)
    @candies << candy
  end

  def contains?(type)
    @candies.find { |candy| candy.type == type }
    
  end
end

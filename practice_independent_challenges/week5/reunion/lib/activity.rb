class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.size
  end

  def owed
    debt_collector = {}
    @participants.each do |key, value|
      debt_collector[key] = split - value
    end
    debt_collector
  end
end

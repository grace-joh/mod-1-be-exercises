class Groomer
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end
end

class Pet
  attr_reader :name, :type, :age, :fed

  def initialize(pet_hash)
    @name = pet_hash[:name]
    @type = pet_hash[:type]
    @age = pet_hash[:age]
    @fed = false
  end
end

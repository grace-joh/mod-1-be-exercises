class Street
  attr_reader :name, :buildings

  def initialize(name)
    @name = name
    @buildings = []
  end

  def add_building(building)
    @buildings << building.building_name
    @buildings.sort!
  end
end

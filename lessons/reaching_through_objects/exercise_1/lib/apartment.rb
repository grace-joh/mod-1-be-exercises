class Apartment
  attr_reader :rented, :rooms

  def initialize
    @rented = false
    @rooms = []
  end

  def is_rented?
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(room)
    @rooms << room
  end

  def list_rooms_by_name_alphabetically
    @room_names = []
    @rooms.each { |room| @room_names << room.name }
    @room_names.sort
  end
end

require 'spec_helper'

RSpec.describe Apartment do
  describe '#initialize' do
    it 'can initialze' do
      apartment = Apartment.new

      expect(apartment).to be_a Apartment
    end
  end

  describe '#is_rented and #rent' do
    it 'can check rent status' do
      apartment = Apartment.new

      expect(apartment.is_rented?).to eq(false)

      apartment.rent

      expect(apartment.is_rented?).to eq(true)
    end
  end

  describe '#add_room' do
    it 'can add a room' do
      apartment = Apartment.new
      bathroom = Room.new("bathroom")
      laundry = Room.new("laundry")
      kitchen = Room.new("kitchen")
      bedroom = Room.new("bedroom")
      apartment.add_room(bathroom)
      apartment.add_room(laundry)
      apartment.add_room(kitchen)
      apartment.add_room(bedroom)

      expect(apartment.rooms).to eq([bathroom, laundry, kitchen, bedroom])
    end

    it 'can limit rooms to 4 max' do
      apartment = Apartment.new
      bathroom = Room.new("bathroom")
      laundry = Room.new("laundry")
      kitchen = Room.new("kitchen")
      bedroom = Room.new("bedroom")
      apartment.add_room(bathroom)
      apartment.add_room(laundry)
      apartment.add_room(kitchen)
      apartment.add_room(bedroom)
      apartment.add_room(Room.new("library"))

      expect(apartment.rooms).to eq([bathroom, laundry, kitchen, bedroom])
    end

    it 'can return rooms alphabetically' do
      apartment = Apartment.new
      bathroom = Room.new("bathroom")
      laundry = Room.new("laundry")
      kitchen = Room.new("kitchen")
      bedroom = Room.new("bedroom")
      apartment.add_room(bathroom)
      apartment.add_room(laundry)
      apartment.add_room(kitchen)
      apartment.add_room(bedroom)

      expect(apartment.list_rooms_by_name_alphabetically).to eq(["bathroom", "bedroom", "kitchen", "laundry"])
    end
  end
end

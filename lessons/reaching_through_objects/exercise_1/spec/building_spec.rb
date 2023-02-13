require 'spec_helper'

RSpec.describe Building do
  describe '#initialize' do
    it 'can initialize' do
      building = Building.new('623', 'Savills Apartment Building')

      expect(building).to be_a Building
      expect(building.building_number).to eq('623')
      expect(building.building_name).to eq('Savills Apartment Building')
    end
  end

  describe '#add_apartment and #list_apartment' do
    it 'can add and list apartments' do
      building = Building.new('623', 'Savills Apartment Building')
      apt_1 = Apartment.new
      apt_2 = Apartment.new
      apt_5 = Apartment.new
      building.add_apartment(apt_1)
      building.add_apartment(apt_2)
      building.add_apartment(apt_5)

      expect(building.list_apartments).to eq([apt_1, apt_2, apt_5])
    end

    it 'can limit apartments in a building' do
      building = Building.new('623', 'Savills Apartment Building')
      apt_1 = Apartment.new
      apt_2 = Apartment.new
      apt_5 = Apartment.new
      apt_3 = Apartment.new
      apt_4 = Apartment.new
      building.add_apartment(apt_1)
      building.add_apartment(apt_2)
      building.add_apartment(apt_5)
      building.add_apartment(apt_3)
      building.add_apartment(apt_4)

      expect(building.list_apartments).to eq([apt_1, apt_2, apt_5, apt_3])
    end
  end
end

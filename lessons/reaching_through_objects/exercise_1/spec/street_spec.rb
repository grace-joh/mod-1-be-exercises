require 'spec_helper'

RSpec.describe Street do
  describe '#initialize' do
    it 'can initialize' do
      adlington = Street.new("Adlington Road")

      expect(adlington).to be_a Street
      expect(adlington.name).to eq("Adlington Road")
    end
  end

  describe '#add_building' do
    it 'can add buildings to block' do
      adlington = Street.new('Adlington Road')
      savills = Building.new('623', 'Savills Apartment Building')
      adlington.add_building(savills)

      expect(adlington.buildings).to eq(['Savills Apartment Building'])
    end

    it 'can add multiple buildings to block and list alphabetically' do
      adlington = Street.new('Adlington Road')
      savills = Building.new('623', 'Savills Apartment Building')
      zebra = Building.new('123', 'Zebra Apartments')
      adlington.add_building(zebra)
      adlington.add_building(savills)

      expect(adlington.buildings).to eq(['Savills Apartment Building', 'Zebra Apartments'])
    end
  end
end
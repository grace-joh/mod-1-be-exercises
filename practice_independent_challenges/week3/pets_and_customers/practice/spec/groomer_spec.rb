require 'spec_helper'

RSpec.describe Groomer do
  describe '#initialize' do
    it 'can initialize' do
      furry_tails = Groomer.new('Furry Tails')

      expect(furry_tails).to be_a Groomer
      expect(furry_tails.name).to eq('Furry Tails')
      expect(furry_tails.customers).to eq([])
    end

    it 'can initialize another groomer' do
      friends_furever = Groomer.new('Friends Furever')

      expect(friends_furever).to be_a Groomer
      expect(friends_furever.name).to eq('Friends Furever')
      expect(friends_furever.customers).to eq([])
    end
  end

  describe '#add_customer' do
    before(:each) do
      @furry_tails = Groomer.new('Furry Tails')
      @joel = Customer.new("Joel", 2)
      @samson = Pet.new({name: "Samson", type: :dog, age: 3})
      @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
      @chris = Customer.new("Chris", 3)
      @joel.adopt(@samson)
      @chris.adopt(@lucy)
    end

    it 'can add customer to customers array' do
      @furry_tails.add_customer(@joel)
      @furry_tails.add_customer(@chris)

      expect(@furry_tails.customers).to eq([@joel, @chris])
    end
  end
end

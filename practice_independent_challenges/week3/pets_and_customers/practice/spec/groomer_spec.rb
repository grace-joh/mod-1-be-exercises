require 'spec_helper'

RSpec.describe Groomer do
  before(:each) do
    @furry_tails = Groomer.new('Furry Tails')
    @friends_furever = Groomer.new('Friends Furever')
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lily = Pet.new({name: "Lily", type: :cat, age: 1})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @chris = Customer.new("Chris", 3)
    @joel.adopt(@samson)
    @joel.adopt(@lily)
    @chris.adopt(@lucy)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@furry_tails).to be_a Groomer
      expect(@furry_tails.name).to eq('Furry Tails')
      expect(@furry_tails.customers).to eq([])
    end

    it 'can initialize another groomer' do
      expect(@friends_furever).to be_a Groomer
      expect(@friends_furever.name).to eq('Friends Furever')
      expect(@friends_furever.customers).to eq([])
    end
  end

  describe '#add_customer' do
    it 'can add customer to customers array' do
      @furry_tails.add_customer(@joel)
      @furry_tails.add_customer(@chris)

      expect(@furry_tails.customers).to eq([@joel, @chris])
    end
  end

  describe '#customers_with_unpaid_balance' do
    it 'can return an array of customers with outstanding balances' do
      @furry_tails.add_customer(@joel)
      @furry_tails.add_customer(@chris)
      @joel.charge(15)
      @joel.charge(7)
      @chris.charge(7)

      expect(@furry_tails.customers_with_unpaid_balance).to eq([@joel, @chris])
    end
  end

  describe '#count_by_type' do
    it 'can return the number of pets of a given type' do
      @furry_tails.add_customer(@joel)
      @furry_tails.add_customer(@chris)

      expect(@furry_tails.count_by_type('dog')).to eq(1)
      expect(@furry_tails.count_by_type('cat')).to eq(2)
    end
  end
end

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
      expect(@furry_tails.services).to eq({})
      expect(@furry_tails.charges).to eq([])
    end

    it 'can initialize another groomer' do
      expect(@friends_furever).to be_a Groomer
      expect(@friends_furever.name).to eq('Friends Furever')
      expect(@friends_furever.customers).to eq([])
      expect(@friends_furever.services).to eq({})
      expect(@friends_furever.charges).to eq([])
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

  describe '#add_service' do
    it 'can add a service and the cost to groomers list of services' do
      @furry_tails.add_service(:bath, 20)
      @furry_tails.add_service(:cut, 40)
      @furry_tails.add_service(:full_groom, 55)

      expect(@furry_tails.services).to eq({ bath: 20, cut: 40, full_groom: 55 })
    end
  end

  describe '#add_charge' do
    it 'can add a charge with type, cost, customer, and pet' do
      @furry_tails.add_service(:bath, 20)
      @furry_tails.add_service(:cut, 40)
      @furry_tails.add_service(:full_groom, 55)
      @furry_tails.add_charge(:bath, @joel, @samson)

      expect(@furry_tails.charges).to eq([{ type: :bath, cost: 20, customer: @joel, pet: @samson }])
    end
  end
end

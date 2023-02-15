require 'spec_helper'

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @chris = Customer.new("Chris", 3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@joel).to be_a Customer
      expect(@joel.name).to eq("Joel")
      expect(@joel.id).to eq(2)
      expect(@joel.pets).to eq([])
      expect(@joel.outstanding_balance).to eq(0)
    end

    it 'can initialize another customer' do
      expect(@chris).to be_a Customer
      expect(@chris.name).to eq("Chris")
      expect(@chris.id).to eq(3)
      expect(@chris.pets).to eq([])
      expect(@chris.outstanding_balance).to eq(0)
    end
  end

  describe '#adopt' do
    it 'can allow customer to adopt pets' do
      @joel.adopt(@samson)
      @joel.adopt(@lucy)

      expect(@joel.pets).to eq([@samson, @lucy])
    end
  end

  describe '#charge' do
    it 'can add a fee to outstanding balance' do
      @joel.charge(15)
      @joel.charge(7)

      expect(@joel.outstanding_balance).to eq(22)
    end
  end
end

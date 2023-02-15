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
end

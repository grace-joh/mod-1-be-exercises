require 'rspec'
require './lib/potluck'

RSpec.describe Potluck do
  before(:each) do
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entree)
  end
  
  describe '#initialize' do
    it 'creates a new potluck with a date' do
      expect(@potluck).to be_a(Potluck)
      expect(@potluck.date).to eq("7-13-18")
      expect(@potluck.dishes).to be_empty
    end
  end

  describe '#add_dish' do
    it 'adds dishes' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@cocktail_meatballs)

      expect(@potluck.dishes).to eq([@couscous_salad, @cocktail_meatballs])
      expect(@potluck.dishes.length).to eq(2)      
    end
  end
end
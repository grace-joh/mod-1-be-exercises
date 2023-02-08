require 'rspec'
require './lib/potluck'

RSpec.describe Potluck do
  before(:each) do
    @potluck = Potluck.new("7-13-18")
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entree)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entree)
    @candy_salad = Dish.new("Candy Salad", :dessert)
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

  describe '#get_all_from_category' do
    it 'returns dishes from given category' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)

      expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous_salad, @summer_pizza])
      expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous_salad)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end
end
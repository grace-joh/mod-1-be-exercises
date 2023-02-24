require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@pick_4).to be_a Game
      expect(@pick_4.name).to eq ('Pick 4')
      expect(@pick_4.cost).to eq(2)
      expect(@pick_4.national_drawing).to eq(false)
    end

    it 'can make another game' do
      expect(@mega_millions).to be_a Game
      expect(@mega_millions.name).to eq ('Mega Millions')
      expect(@mega_millions.cost).to eq(5)
      expect(@mega_millions.national_drawing).to eq(true)
    end
  end

  describe '#national_drawing?' do
    it 'returns value of national_drawing' do
      expect(@pick_4.national_drawing?).to eq(false)
      expect(@mega_millions.national_drawing?).to eq(true)
    end
  end
end

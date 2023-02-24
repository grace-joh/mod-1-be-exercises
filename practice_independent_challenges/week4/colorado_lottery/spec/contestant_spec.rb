require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @alexander = Contestant.new({ first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10 })
    @leo = Contestant.new({ first_name: 'Leo',
                            last_name: 'Joh',
                            age: 18,
                            state_of_residence: 'TX',
                            spending_money: 8 })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@alexander).to be_a Contestant
      expect(@alexander.first_name).to eq('Alexander')
      expect(@alexander.last_name).to eq('Aigiades')
      expect(@alexander.age).to eq(28)
      expect(@alexander.state_of_residence).to eq('CO')
      expect(@alexander.spending_money).to eq(10)
      expect(@alexander.game_interests).to eq([])
    end

    it 'can create another contestant' do
      expect(@leo).to be_a Contestant
      expect(@leo.first_name).to eq('Leo')
      expect(@leo.last_name).to eq('Joh')
      expect(@leo.age).to eq(18)
      expect(@leo.state_of_residence).to eq('TX')
      expect(@leo.spending_money).to eq(8)
      expect(@leo.game_interests).to eq([])
    end
  end

  describe '#full_name' do
    it 'joins first and last name' do
      expect(@alexander.full_name).to eq('Alexander Aigiades')
    end
  end

  describe '#out_of_state?' do
    it 'returns false if contestant is from CO' do
      expect(@alexander.out_of_state?).to be false
    end

    it 'returns true if contestant is not from CO' do
      expect(@leo.out_of_state?).to be true
    end
  end
end

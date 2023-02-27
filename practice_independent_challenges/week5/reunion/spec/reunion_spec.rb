require 'spec_helper'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new('2301 BE') }
  let(:activity1) { Activity.new('Brunch') }

  describe '#initialize' do
    it 'exists' do
      expect(reunion).to be_a Reunion
      expect(reunion.name).to eq('2301 BE')
      expect(reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'adds an activity to the activities array' do
      reunion.add_activity(activity1)
      
      expect(reunion.activities).to eq([activity1])
    end
  end
end

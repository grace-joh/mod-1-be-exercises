require 'spec_helper'

RSpec.describe Activity do
  let(:activity) { Activity.new('Brunch') }

  describe '#initialize' do
    it 'exists' do
      expect(activity).to be_a Activity
      expect(activity.name).to eq('Brunch')
      expect(activity.participants).to eq({})
    end
  end

  describe '#add_participant' do
    it 'adds participant name and amount paid to the participants array' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)

      expect(activity.participants).to eq({ 'Maria' => 20, 'Luther' => 40 })
    end
  end

  describe '#total_cost' do
    it 'returns the sum of all amounts paid' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)

      expect(activity.total_cost).to eq(60)
    end
  end

  describe '#split' do
    it 'returns the average amount paid among all participants' do
      activity.add_participant('Grace', 20)
      activity.add_participant('Rebekah', 40)
      activity.add_participant('Christine', 20)

      expect(activity.split).to eq(26.67)
    end
  end

  describe '#owed' do
    it 'returns a hash with the amounts each person owes (or is owed if negative)' do
      activity.add_participant('Maria', 20)
      activity.add_participant('Luther', 40)

      expect(activity.owed).to eq({ 'Maria' => 10, 'Luther' => -10 })
      expect(activity.participants).to eq({ 'Maria' => 20, 'Luther' => 40 })
    end
  end
end

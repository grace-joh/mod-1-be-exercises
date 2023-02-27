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
end

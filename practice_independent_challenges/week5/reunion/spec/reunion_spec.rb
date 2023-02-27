require 'spec_helper'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new('2301 BE') }
  let(:activity1) { Activity.new('Brunch') }
  let(:activity2) { Activity.new('Zoo') }
  let(:activity3) { Activity.new('Hotel') }


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

  describe '#total_cost' do
    it 'sums the total cost of all activities' do
      reunion.add_activity(activity1)
      activity1.add_participant('Grace', 20)
      activity1.add_participant('Rebekah', 40)
      activity1.add_participant('Christine', 30)
      reunion.add_activity(activity2)
      activity2.add_participant('Grace', 30)
      activity2.add_participant('Rebekah', 30)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      expect(reunion.total_cost).to eq(250)
    end
  end

  describe '#total_owed' do
    it 'returns a hash of how much each participant owes' do
      reunion.add_activity(activity1)
      activity1.add_participant('Grace', 20)
      activity1.add_participant('Rebekah', 40)
      activity1.add_participant('Christine', 30)
      reunion.add_activity(activity2)
      activity2.add_participant('Grace', 30)
      activity2.add_participant('Rebekah', 30)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      expect(reunion.total_owed).to eq({ 'Grace' => 0, 'Rebekah' => 30, 'Christine' => -30 })
    end
  end

  describe '#print_summary' do
    it 'prints a summary of each participants name and what they owe' do
      reunion.add_activity(activity1)
      activity1.add_participant('Grace', 20)
      activity1.add_participant('Rebekah', 40)
      activity1.add_participant('Christine', 30)
      reunion.add_activity(activity2)
      activity2.add_participant('Grace', 30)
      activity2.add_participant('Rebekah', 30)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      expect { reunion.print_summary }.to output("2301 BE Reunion Summary\nGrace: $0.00\nRebekah: $30.00\nChristine: -$30.00\n").to_stdout
    end
  end

  describe '#print_detailed_summary' do
    it 'prints a summary of each participants name and what they owe' do
      reunion.add_activity(activity1)
      activity1.add_participant('Grace', 20)
      activity1.add_participant('Rebekah', 40)
      activity1.add_participant('Christine', 30)
      reunion.add_activity(activity2)
      activity2.add_participant('Grace', 30)
      activity2.add_participant('Rebekah', 30)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      expect { reunion.print_summary }.to output("2301 BE Reunion Detailed Summary\nGrace: $0.00\nRebekah: $30.00\nChristine: -$30.00\n").to_stdout
    end
  end
end

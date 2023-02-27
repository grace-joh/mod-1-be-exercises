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
      activity2.add_participant('Grace', 35)
      activity2.add_participant('Rebekah', 25)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      $stdout = StringIO.new
      reunion.print_detailed_summary
      $stdout.rewind

      expect($stdout.gets).to eq("2301 BE Reunion Detailed Summary\n")
      expect($stdout.gets).to eq("- Grace -\n")
      expect($stdout.gets).to eq("Brunch: You owe $10.00\n")
      expect($stdout.gets).to eq("Zoo: You are owed $15.00\n")
      expect($stdout.gets).to eq("- Rebekah -\n")
      expect($stdout.gets).to eq("Brunch: You are owed $10.00\n")
      expect($stdout.gets).to eq("Zoo: You are owed $5.00\n")
      expect($stdout.gets).to eq("Hotel: You owe $50.00\n")
      expect($stdout.gets).to eq("- Christine -\n")
      expect($stdout.gets).to eq("Brunch: You're good!\n")
      expect($stdout.gets).to eq("Zoo: You owe $20.00\n")
      # expect($stdout.gets).to eq("Zoo: You owe $5.00\n")
      expect($stdout.gets).to eq("Hotel: You are owed $50.00\n")

      # expect($stdout.gets).to eq("2301 BE Reunion Detailed Summary\n")
      # expect($stdout.gets).to eq("- Grace -\n")
      # expect($stdout.gets).to eq("Brunch: You owe Rebekah $10.00\n")
      # expect($stdout.gets).to eq("Zoo: Christine owes you $15.00\n")
      # expect($stdout.gets).to eq("- Rebekah -\n")
      # expect($stdout.gets).to eq("Brunch: Grace owes you $10.00\n")
      # expect($stdout.gets).to eq("Zoo: Christine owes you $5.00\n")
      # expect($stdout.gets).to eq("Hotel: You owe Christine $50.00\n")
      # expect($stdout.gets).to eq("- Christine -\n")
      # expect($stdout.gets).to eq("Brunch: You're good!\n")
      # expect($stdout.gets).to eq("Zoo: You owe Grace $15.00\n")
      # expect($stdout.gets).to eq("Zoo: You owe Rebekah $5.00\n")
      # expect($stdout.gets).to eq("Hotel: Rebekah owes you $50.00\n")
    end
  end

  describe '#detailed_summary_hash' do
    it 'returns a hash of a participant key and a nested hash value with activity and dues' do
      reunion.add_activity(activity1)
      activity1.add_participant('Grace', 20)
      activity1.add_participant('Rebekah', 40)
      activity1.add_participant('Christine', 30)
      reunion.add_activity(activity2)
      activity2.add_participant('Grace', 35)
      activity2.add_participant('Rebekah', 25)
      activity2.add_participant('Christine', 0)
      reunion.add_activity(activity3)
      activity3.add_participant('Rebekah', 0)
      activity3.add_participant('Christine', 100)

      expect(reunion.detailed_summary_hash).to eq(
        { 'Grace' => { 'Brunch' => 10.0, 'Zoo' => -15.0 },
          'Rebekah' => { 'Brunch' => -10.0, 'Zoo' => -5.0, 'Hotel' => 50.0 },
          'Christine' => { 'Brunch' => 0.0, 'Zoo' => 20.0, 'Hotel' => -50.0 } }
      )
    end
  end
end

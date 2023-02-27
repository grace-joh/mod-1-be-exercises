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
end

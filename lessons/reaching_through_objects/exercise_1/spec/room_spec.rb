require 'spec_helper'

RSpec.describe Room do
  describe '#initialize' do
    it 'can initialize' do
      bathroom = Room.new("bathroom")

      expect(bathroom).to be_a Room
      expect(bathroom.name).to eq("bathroom")
    end
  end
end

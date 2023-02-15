require 'spec_helper'

RSpec.describe Pet do
  describe '#initialize' do
    it 'can initialize' do
      samson = Pet.new({name: "Samson", type: :dog, age: 3})

      expect(samson).to be_a Pet
      expect(samson.name).to eq("Samson")
      expect(samson.type).to eq(:dog)
      expect(samson.age).to eq(3)
      expect(samson.fed).to eq(false)
    end

    it 'can initialize another pet' do
      lily = Pet.new({name: "Lily", type: :cat, age: 1})

      expect(lily).to be_a Pet
      expect(lily.name).to eq("Lily")
      expect(lily.type).to eq(:cat)
      expect(lily.age).to eq(1)
      expect(lily.fed).to eq(false)
    end
  end
end

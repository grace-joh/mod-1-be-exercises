# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings

animals = []
nested_animals.each do |array|
  array.each do |animal|
    animals << animal.to_s
  end
end
print animals

# 2. Return an unnested array of animals with length >= 4

big_animals = []
nested_animals.each do |nested_animal|
  nested_animal.each do |animal|
    big_animals << animal if animal.size >= 4
  end
end
print big_animals

# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

new_hash = {}
nested_animals.each do |nested_animal|
  nested_animal.each do |animal|
    new_hash[animal] = animal.length
  end
end
print new_hash

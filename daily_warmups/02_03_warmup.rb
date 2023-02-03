# Sentence Array: 
# Write a method that adds each word of a sentence to an array. 
# Then, capitalize every other word in the sentence. Return the new sentence. 
# Example: 
# "The quick brown fox jumps over the lazy dog." 
# ["The", "quick", "brown" …]
# => "The quick Brown fox Jumps over The lazy Dog."

# Extensions:
# Use a sentence with other capital letters in it. The method should still capitalize every 
# alternate word, regardless of other capitalization. 
# Use a sentence with special characters, spaces, etc. Does your method still work? 
# Refactor your solution to keep your main method under 5 lines. Use helper methods. 
# Write a test suite to prove that your solution works.

sentence = "The quick brown fox jumps over the lazy dog."

def array_and_cap(sentence)
  sentence.split(' ').map.with_index {|word, index| if index.even? then word.capitalize else word end}.join(' ')
end

p array_and_cap(sentence)

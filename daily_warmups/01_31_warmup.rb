# Reversing Strings: Write a method that reverses the string passed into it.
# Example: 
# 'world'  =>  'dlrow'
# 'word'   =>  'drow'

# Extensions: 
# Use strings with special characters
# Use strings with spaces - where does the space go?
# Don't use any Ruby enumerables like (reverse)! 
# Use longer sentences. Does your solution still work? 

example = 'This is a longer sentence with spaces and $p3c!4l Characters.'

def backward(string)
  split_string = string.split('')
  reverse_string = []
  i = split_string.length 
  while i > 0
    reverse_string << split_string[i-1]
    i -= 1
  end
  return reverse_string.join('')  
end

p backward(example)


#### following methods pass in an array of strings


#method with enumerable
# strings = ['world', 'word', "special&character", 'strings with spaces', 'This is a longer sentence']

# def backwards(array)
#   array.map do {|word| word.reverse}
# end

# puts backwards(strings)


#method without enumerable
# def reversed(array)
#   split_strings = []

#   for i in 1..(array.length) do
#     split_strings << array[i-1].split('')
#   end
  
#   reversed_words = []
  
#   for i in 1..(array.length) do
#     reverse_word = []
#     j = (array[i-1].length) 
#     while j > 0
#       reverse_word << array[i-1][j-1]
#       j -= 1
#     end
#     reversed_words << reverse_word.join('')
#   end

#   return reversed_words
# end

# p reversed(strings)
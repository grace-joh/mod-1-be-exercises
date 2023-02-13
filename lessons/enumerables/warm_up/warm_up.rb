# 1. Using #each, add to the method below, such that it takes in an array of names, 
# and returns an array of all names upcased.

kardashians = ["kris", "kim", "kourtney", "khloe", "rob"]

def upcase_names(names)
  upcase = []
  names.each do |name|
    upcase << name.upcase
  end
  upcase
# names.map{|name| name.upcase}
# names.map(&:upcase)
end 

# above method returns a copy array, whereas
# ! is destructive, returns the kardashians array but modified

# def upcase_names(names)
#   names.each do |name|
#     name.upcase!
#   end
# end

p upcase_names(kardashians)
# should return ["KRIS", "KIM", "KOURTNEY", "KHLOE", "ROB"]


# 2. Using #each, update the method below, such that it takes in an array of names,
# and returns a collection of the names that end in 'ie'

pets = ["Brutus", "Lucky", "Goldie", "Pepper", "Odie"]

def names_ending_in_ie(names)
  ie = []  
  names.each do |name|
    ie << name if name.end_with?("ie")  
    # if name.end_with?("ie")
    #   ie << name
    # end
  end
  ie
  # names.select{|name| name.end_with?("ie")}
end 

p names_ending_in_ie(pets)
# should return an array of ["Goldie", "Odie"]


# 3. Using #each, update the method below, such that it takes in an array of integers,
# and returns the first number that is over 100 when squared. 

nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

def first_num_thats_square_is_above_100(nums)
  nums.each do |num|
    return num if num * num > 100
    # if num * num > 100
    #   return num
    # end
  end
end 

# return breaks you out of the whole method 

p first_num_thats_square_is_above_100(nums)
# should return the integer 11
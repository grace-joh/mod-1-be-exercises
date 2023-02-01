# Write a method to format this list of prices into strings. They should read as  "$##.##". 
# Fill any missing places with "0". 
# $2.50 => "$02.50"
# 32.25$
# 3$.25
# 9.$50
# 75.98

# Extension: Write tests that prove your solution works. 

def price_format(price)
  "$%05.2f" % price.delete('$')
end

p price_format("$2.50")
p price_format("32.25$")
p price_format("3$.25")
p price_format("9.$50")
p price_format("75.98")

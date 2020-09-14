# problem
# take in a string
# retrun a NEW string in which every character is doubled

# examples
#repeater('Hello') == "HHeelllloo"
#repeater("Good job!") == "GGoooodd  jjoobb!!"
#repeater('') == ''
#repeater(' ') == '  '

# ds/algo
# initalize an empty array doubler
# convert the string argument into char array
# iterate over the char array
  # inject doubler with the char twice
# convert the doubler array back into a string
# return the string

# code
def repeater(str)
  doubler = []
  chars = str.chars
  chars.each do |char|
    doubler << char * 2
  end
  doubler.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
p repeater(' ') == '  '

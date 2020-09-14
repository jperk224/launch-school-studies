# problem
# take in an integer
# return an ARRAY of all integers, in sequence, between 1 and the argument

# examples
# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]
# sequence(0) == []


# ds/algo
# initialize an empty array result
# for each number in the range 1 to num
# insert the num in result
# return result

# code
def sequence(num)
  result = []
  num.times do |index|
    result << index + 1
  end
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == []

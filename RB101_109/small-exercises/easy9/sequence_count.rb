# problem
# take in two integer arguments
  # first is a count
  # second is start of sequence
# return an array
  # has same number of elements as count
  # values are multiples of the start

# examples
# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# ds/algo
# initialize an empty array result
# insert the initial int into the array
# insert the next multiple of initial int into the array
# repeat until count is reached
# return the result array

# code
def sequence(count, start)
  result = []
  count.times do |int|
    result << start * (int + 1)
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

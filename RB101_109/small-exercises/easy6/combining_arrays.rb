=begin
# problem
- take 2 arrays
- return a single new array that returns the unique values of both arrays

# examples
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
merge([1], []) == [1]
merge([' '], []) == [' ']
merge([], []) == []


# data structures
input: arrays
output: arrays
rules: array method(s)

# algorithm(s)
- merge the two arrays given into a single array
- mutate the resulting array into a set of only the unique values
=end
# code
# def merge(arr1, arr2)
#   arr1.union(arr2)
# end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([1], []) == [1]
p merge([' '], []) == [' ']
p merge([], []) == []

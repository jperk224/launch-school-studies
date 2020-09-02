=begin
# problem
- take in 2 arrays as arguments
- return a NEW single array
  - contains all elements from both array arguments
  - elements take in alteration (e.g. arr1[0], arr2[0], arr1[1], arr2[1], etc.)
- safe to assume both input arrays are non empty and have the same number of elements

# examples/test cases
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1], ['a']) == [1, 'a']

# data structure(s)
inputs: arrays
output: array
rules: logic/iteration

# algorithm(s)
- initialize local variable combined_array and assign it to an empty array []
- iterate through the first array with index
- for each iteration insert the element at the specific index from each array into combined_array

=end
# code
# def interleave(arr1, arr2)
#   combined_array = []
#   arr1.each_with_index do |_, index|
#     combined_array << arr1[index]
#     combined_array << arr2[index]
#   end
#   combined_array
# end

# further exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave([1], ['a']) == [1, 'a']

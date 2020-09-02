=begin
# problem
- take in two array arguments, each array contains a list of numbers
  - can assume they are not empty and contain the same number of elements
- return a NEW array of elements where each is the product of the associated indices
  - e.g. new_arr[0] = arr1[0] * arr2[0]

# examples/test cases
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# data structure(s)
inputs: arrays
output: array

# algorithm
initialize an empty result array
iterate over the first array
during each iteration, inject result array with the product of the array elemtns at that iteration

=end
# code
# def multiply_list(arr1, arr2)
#   result = []
#   arr1.each_with_index do |_, index|
#     result << arr1[index] * arr2[index]
#   end
#   result
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2) { |arr| arr.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
p multiply_list([10, 5, 7, 8, 3, 2], [9, 10, 11, 2, 2, 2]) #== [90, 50, 77, 16, 6, 4]

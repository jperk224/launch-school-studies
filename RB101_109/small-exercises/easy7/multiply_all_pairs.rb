# problem
# take in two arrays of numbers (Assume neither array is empty)
# return a NEW array
  # contains the product of every pair of numbers between the two arrays
  # sorted by increasing value

# examples
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
# p multiply_all_pairs([0], [4, 3, 1, 2]) == [0, 0, 0, 0]
# p multiply_all_pairs([0, 0], [0, 0, 0]) == [0, 0, 0, 0, 0, 0]
# p multiply_all_pairs([1], [3, 4, 5]) == [3, 4, 5]

# ds/algo
# initialize an empty product array
# take the first element in the first array, multiply it by the first element in the 
# second array; append the product to the product array
  # repeat for every element in the second array
# repeat for every element in the first array
# sort the product array
# return the product array

# code
def multiply_all_pairs(arr1, arr2)
  product_array = []
  arr1.each do |num1|
    arr2.each do |num2|
      product_array << (num1 * num2)
    end
  end
  product_array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs([0], [4, 3, 1, 2]) == [0, 0, 0, 0]
p multiply_all_pairs([0, 0], [0, 0, 0]) == [0, 0, 0, 0, 0, 0]
p multiply_all_pairs([1], [3, 4, 5]) == [3, 4, 5]

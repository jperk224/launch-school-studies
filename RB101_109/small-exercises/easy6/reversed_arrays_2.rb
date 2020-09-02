=begin
# problem
- take in an array and return a NEW array
- NEW array should be in reverse order, do not modify the original list
- cannot use #reverse or #reverse!

# examples/test cases
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true


# data structure(s)
input: array
output: array


# algorithm(s)
1. create a new empty array to return
3. set the first element in the new array equal to the last element of the original array
4. repeat for each corresponding element and its mirror until midpoint is reached/passed

=end
# code
# def reverse(array)
#   reversed_array = []
#   counter = 0
#   loop do
#     break if counter >= array.length
#     reversed_array[counter] = array[-1 * (counter + 1)]
#     counter += 1
#   end
#   reversed_array
# end

def reverse(array)
  array.each_with_object([]) do |element, reversed_array|
    reversed_array.unshift(element)
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

=begin
# problem
- take in an array 
- mutate the given array
  - reverse the elements in-place
- return value should be the same array object (check the object_id)
- may not use #reverse or #reverse!

# examples/test cases
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

# data structure(s)
input: array
output: the SAME array (reversed)

# algorithm(s)
1. find the midpoint of the array
2. initalize a temporary variable temp
3. store the first array element in temp
4. reassign first element to last
5. reassign last element to temp
6. move up/in one step
7. repeat until midpint is reached
=end
# code
def reverse!(array)
  midpoint = array.length / 2.0
  counter = 0
  loop do
    break if counter >= midpoint
    temp = array[counter]
    array[counter] = array[-1 * (counter + 1)]
    array[-1 * (counter + 1)] = temp
    counter += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result #== [4, 3, 2, 1]
p list #== [4, 3, 2, 1]
p list.object_id 
p result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
p list #== ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
p list # == ["abc"]

list = []
reverse!(list) == []
p list #== []

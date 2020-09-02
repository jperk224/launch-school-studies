=begin
# problem
- take in an array
- return a nested array with two sub-arrays
  - first array contains first half of the original
  - second array contains second half of the original
- if original's size if odd, the middle element should be placed in the first array

# examples/test cases
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

# data structure(s)
input: array
output: nested array

# algorithm(s)
- initialize an empty array nested_halves
- insert empty arrays, first_half and second_half into nested_halves
- calculate the midpoint
  - if orignal array length is odd, add one to the midpoint
- from beginning of the array to the midpoint, insert orignal array elements into first_half (slice?)
- from midpoint to end of the original array insert array elements into first half (slice?)
### 

=end
# code
def halvsies(array)
  nested_halves = []
  midpoint = array.length / 2
  midpoint += 1 if array.length.odd?
  first_half = array.slice(0, midpoint)
  second_half = array.slice(midpoint, array.length)
  nested_halves << first_half
  nested_halves << second_half
  nested_halves
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) #== [[1, 5, 2], [4, 3]]
p halvsies([5]) #== [[5], []]
p halvsies([]) #== [[], []]

=begin
# problem
- take in an array and a search value
- return true if search value in array argument
- false otherwise
- cannot use #include?

# examples/test cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
p include?([''], ' ') == false
p include?([''], '') == true
p include?([], '') == false
p include?([[1,2,3], [4,5,6], [7,8,9]], [7,8,9]) == true
p include?([[1,2,3], [4,5,6], [7,8,9]], []) == false

# data structure(s)
Input(s): array, other type
Output: boolean

# algorithm
iterate through the array argument
during each iteration compare the iteration's array element to the argument provided
if there's a match, break and return true (early return)

=end
# code
def include?(array, search_element)
  array.each do |element|
    return true if element == search_element
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
p include?([''], ' ') == false
p include?([''], '') == true
p include?([], '') == false
p include?([[1,2,3], [4,5,6], [7,8,9]], [7,8,9]) == true
p include?([[1,2,3], [4,5,6], [7,8,9]], []) == false

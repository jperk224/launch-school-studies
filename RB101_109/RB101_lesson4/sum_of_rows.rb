## Sum Even Number Rows
=begin
Imagine a sequence of consecutive even integers beginning with 2.
The integers are grouped in rows, with the first row contianing one integer,
the second row two integers, the third row three integers, and so on.
Given an integer representing the number of a particular row,
return an integer representing the sum of all the integers in that row
=end

# Problem Summary
=begin
- Sequence of consecutive even integers that starts with 2
- Sequence is groups into rows
- each row is incrementally larger than the last: row 1 = 1, row 2 = 2, row 3 = 3, etc.
- Row 'number' will equal number of elements in that row? (only true if row count starts at 1, not 0)
  - Row 1 has one element, Row 2 has two elements, Row 3 has three elements, etc.
- Input: Integer => row number, the row represented is a subset of the sequence of integers
- Output: Integer => sum of elements in the row identified by the input integer
- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30...

2                 # => 2
4 6               # => 10
8 10 12           # => 20
14 16 18 20       # => 68
...

- How do we create the structure above?
  create it as we need it based on the input integer
=end

# Examples/Test Cases
=begin
Input: 1   Output: 2 
Input: 2   Output: 10
Input: 4   Output: 68
=end

# Data Structures
=begin
- Overall structure is a sequence as a whole
- Individual rows within the structure
- Individual rows are in a set order in context of sequence
- Each individual row contains integers
  - Assume integers are in set order in the context of the sequence
- Nested array
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ... n
]
- It's evident setting up this strucutre is going to be the most difficult step of the problem
# Calculating the start integer:
- first integer of row is equal to last integer of preceding row + 2
# Algorithm
  - get the last row of the rows array 
  - get the last integer of that row
  - add 2 to that integer
=end


# The Algorithm
=begin
###### MAIN ALGORITHM #####
1. create an empty 'rows' array to hold all of the rows
2. create a row array and add it to the 'rows' array
3. Repeat step 2 until all the necessary rows have been created (equal to imput value)
  a. All rows have been created when 'rows' array length is equal to the input
4. Sum the final row
5. Return the sum of the final row

##### Sub Algorithm (separate method) #####
# Create a row in the array (from step 2 above)
- Row is an array
- Array contains consecutive even integers
- Integers in each row are part of a larger overall sequence
- Rows are of different lengths
- Input: all information needed to produce the output
  - length
  - staring element
- Output: the row array e.g. [8, 10, 12]

- Examples
  - start: 2, length: 1 => [2]
  - start: 4, length: 2 => [4, 6]
  - start: 8, length: 3 => [8, 10, 12]

- Data Structures
  - Output: flat array of integers

- Algorithm
  1. Create an empty 'row' array to contain the integers
  2. Add the staring integer to 'row' array
  3. increment starting integer by 2
    a. Add incremented result to 'row array
  4. repeat 3 and 3a until 'row' array length matches length input provided
  5. return the array
=end

# Implement the code
def sum_even_number_row(row_number)
  rows = []
  row_length = 1
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    break if row.length >= row_length
    row << current_integer
    current_integer += 2
  end
  row
end

### Test Cases ###
puts sum_even_number_row(1) == 2
puts sum_even_number_row(2) == 10
puts sum_even_number_row(4) == 68
# puts create_row(2, 1) == [2]
# puts create_row(4, 2) == [4, 6]
# puts create_row(8, 3) == [8, 10, 12]
# puts create_row(8, 0) == []
##################

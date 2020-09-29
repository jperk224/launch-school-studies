# transpose any NxN matrix

# row columns
# take in a nested array
# return the number of rows/cols for that arr

# transpose
# initialize a new matrix
# insert empty rows into the matrix equal to the number of cols from the original argument
# iterate over the new matrix
  # each row in the new matrix, append it with the column values from the argument for that associated index

# code
def rows_columns(arr)
  rows = arr.length
  cols = arr[0].length
  [rows, cols]
end

def transpose(arr)
  rows, cols = rows_columns(arr)
  matrix = []
  cols.times { matrix << [] }
  matrix.each_with_index do |row, index|
    rows.times { |num| row << arr[num][index] }
  end
  matrix
end


# examples
# a = [[1, 2, 3, 4]]
# b = [[1], [2], [3], [4]]

# p transpose(a)
# p transpose(b)

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

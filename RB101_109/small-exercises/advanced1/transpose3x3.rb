# take in an array of arrays - 3x3
# return a transposed copy
# do not modify the original array

# ds/algo

# determine the rows and columns of the array
# take in an array
# return its length and the length of a subarray as an array

# create a new empty array matrix
# insert empty rows into the array equal to the number of columns 
# iterate over the empty matirx rows and insert the respective column values at that row's index


# code
def rows_columns(arr)
  [arr.length, arr[0].length]
end

def transpose(arr)
  matrix = []
  rows, cols = rows_columns(arr)
  cols.times do
    matrix << []
  end
  matrix.each_with_index do |row, idx|
    cols.times do |index|
      row << arr[index][idx]
    end
  end
  matrix
end


# examples
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# p transpose(matrix)
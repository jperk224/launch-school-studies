# problem
# take in an nxn matrix
# rotate it to the right 90 degrees 
  # for example in a 3x3 row 1 becomes column 3, row 2 col 2, row 3 col 1

  # in the result # rows become # cols
  # number of cols become # rows

# ds/algo
# create empty rotated array
  # take in a matrix
  # return an array with # cols sub arrays

# rotate90
  # start with the first shell row
  # count backwards from last row to first
    # at each row insert the first element of the row into the shell row

# code
def rotated_matrix_shell(matrix)
  row_count = matrix[0].length
  result = []
  row_count.times do
    result << []
  end
  result
end

def rotate90(matrix)
  rotated_shell = rotated_matrix_shell(matrix)
  rotated_shell.each_with_index do |shell_row, idx|
    (matrix.length - 1).downto(0) do |index|
      shell_row << matrix[index][idx]
    end
  end
  rotated_shell
end

# examples
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

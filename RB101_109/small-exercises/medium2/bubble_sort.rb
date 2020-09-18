# problem
# bubble sort

# examples
=begin
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
=end

# ds/algo
# initialize a loop
  # initialize a swap_occured flag to false
  # initialize index counter to 0
  # initialize a loop
    # swap element at index with element at index + 1 if element at index > element at index + 1
      # if this swap occurs flip the swap flag
  # in the sub array 
  # if a > b, swap flip swap_occured?


# code
def bubble_sort!(arr)
  loop do
    swap_occured = false
    index = 0
    loop do
      break if index > arr.length - 2
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index] 
        swap_occured = true
      end
      index += 1
    end
    break if !swap_occured
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |arr|
  arr.select do |int|
    int % 3 == 0
  end
end

p new_arr

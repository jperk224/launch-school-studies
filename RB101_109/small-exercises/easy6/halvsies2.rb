# problem
# take in an array
# return 2 arrays (pair of nested arrays in an outer array)
  # left - first half
  # right - second half
# if array argument length is odd, left array gets middle element


# examples
# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]


# ds/algo
# find the midpoint of the argument array 
# add one to midpoint if array length is odd
# split argument array based on following criteris
  # is index < midpoint?
    # if yes, first array
    # if no, second array
# return the split result

# code
def halvsies(arr)
  midpoint = arr.length / 2
  midpoint += 1 if arr.length.odd?
  result = [[],[]]
  counter = 0
  loop do
    break if counter >= arr.length
    if counter < midpoint
      result[0] << arr[counter]
    else
      result[1] << arr[counter]
    end
    counter += 1
  end
  result
end

p halvsies([1, 2, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 2, 3, 3, 3, 4]) #== [[1, 2], [3, 4]]
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

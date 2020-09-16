# problem
# write a fib seqence that does notuse recursion
# 1, 1, 2, 3, 5, 8, 13, 21...


# examples
#fibonacci(20) == 6765
#fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501
#fibonacci(1) == 1

# ds/algo
# if int argument is <= 2 return 1
# if n > 2
  # initialize counter set to 3
  # initialize fib1, fib2 to 1
  # sum to fib1 + fib 2
  # set fib1 to fib2
  # set fib2 to sum
  # repeat until n is reached
  # return the sum

# code
def fibonacci(n)
  return 1 if n <= 2
  counter = 3
  fib1 = 1
  fib2 = 1
  sum = 0
  loop do
    sum = fib1 + fib2
    fib1 = fib2
    fib2 = sum
    break if counter >= n
    counter += 1
  end
  sum
end

p fibonacci(1) == 1
p fibonacci(4) == 3
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

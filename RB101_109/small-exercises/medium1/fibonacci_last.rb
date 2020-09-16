# problem
# take in an int, n
# use fib sequence to determine what number in the sequence the nth number is
# return the last digit of the nth number

# examples/edge
# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

# ds/algo
# retun_last
  # convert int argument to an array of individual digits
  # return first element in the array as int

# fibonacci
  # initalize a starting array with 2 values, 1 and 1 (first two vals in fib seq)
  # set variables first and last to first and last elements in the array, respectively
  # initialize counter set to 3
  # set first equal to last
  # set last equalt to sum of frist and last
  # repeat until n is reached
  # return last

# fibonacci_last
  # take in an int
  # initialize fib_result set it return for fibonaacci for n
  # return return_last for fib_result

# code
# def return_last(int)
#   int.digits[0].to_i
# end

# def fibonacci(n)
#   first, last = [1, 1]
#   counter = 3
#   until counter > n
#     first, last = [last, first + last]
#     counter += 1
#   end
#   last
# end

# def fibonacci_last(n)
#   fib_result = fibonacci(n)
#   return_last(fib_result)
# end

# p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20) == 5       # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100) == 5      # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001) == 1  # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

require 'pry'

def fibonacci_last(nth)
  last_digits = [1, 1]
  3.upto(nth) do
    binding.pry
    last_digits = [last_digits[-1], (last_digits[0] + last_digits[-1]) % 10]
    binding.pry
  end
  last_digits[-1]
end

fibonacci_last(7)
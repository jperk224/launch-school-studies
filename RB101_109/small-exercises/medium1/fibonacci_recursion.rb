# problem
# write a recursive fibonacci method
# take in an argument n is an int, return the nth item in the fib sequence


# examples
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

# ds/algo
# if the argument is 1, return 1
# if the argument is 2, return 1
# if the argument is n, call fib(n-1) + fib(n-2)

# code
def fibonacci(int)
  return 1 if int == 1 or int == 2
  fibonacci(int-1) + fibonacci(int-2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

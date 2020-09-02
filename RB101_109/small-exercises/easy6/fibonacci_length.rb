=begin
# problem
- fibonacci series: 1st 2 numbers a 1 by definition, each subsequent is sum of previous 2
  - 1, 1, 2, 3, 5, 8, 13...
- take in an integer, it represents the first number in the sequence with that number if significant digits
- return the index of that number
- safe to assume the argument is always greater than or equal to 2
  - i.e. looking for 2 or more significant digits (no validation needed)
- First fibonacci number has index 1

# examples/test cases
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

# data structure
input: integer
output: integer

# algorithms
1. find the first number in the sequence with significant digits matching the given argument
2. find the fibonacci index of that number
3. return the number

### find first in sequence ###
1. initalize a counter to 3
2. initalize fib1 and fib2 numbers each to 1
3. sum the two numbers
  a. check significant digits
  b. break if significant digits >= argument provided 
4. set fib1 = fib2
5. set fib2 = sum
6. increate the counter
7. continue until significant digits are reached
8. return th counter

### count significant digits ###
1. take the number argument divmod 10
  a. set nem number to the div
  b. append array with the mod
  c. repeat new number is zero
2. return the length of the array
=end
# code
def count_digits(number)
  number.digits.length
end

def find_fibonacci_index_by_length(number_of_digits)
  counter = 3
  fib1 = 1
  fib2 = 1
  loop do
    sum = fib1 + fib2
    break if count_digits(sum) >= number_of_digits
    fib1 = fib2
    fib2 = sum
    counter += 1
  end
  counter
end

# p count_digits(1234) == 4
# p count_digits(0) == 1
# p count_digits(123456789) == 9

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847

# problem
# take two integer arguments
# print out all the numbers between the range
  # if number is divisible by 3 print 'Fizz'
  # if number is divisible by 5 print 'Buzz'
  # if number is divisible by 3 and 5 print 'FizzBuzz'

# examples


# ds/algo
# iterate over the numbers in the range given
# if the number is divisible by 3 and 5 print 'FizzBuzz'
# if number is divisible by 5 print 'Buzz'
# if number is divisible by 3 print 'Fizz'

# code
def fizzbuzz_value(num)
  case
  when num % 5 == 0 && num % 3 == 0 
    'FizzBuzz'
  when num % 5 == 0
    'Buzz'
  when num % 3 == 0
    'Fizz'
  else
    num    
  end
end

def fizzbuzz(num1, num2)
  fizzbuzz_values = []
  (num1..num2).each do |num|
    fizzbuzz_values << fizzbuzz_value(num)
  end
  fizzbuzz_values.join(', ')
end

p fizzbuzz(1,15)

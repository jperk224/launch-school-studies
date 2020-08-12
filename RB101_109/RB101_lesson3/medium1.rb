# Question 1
# 10.times { |i| puts 'The Flintstones Rock!'.rjust('The Flintstones Rock!'.length + i)}
# Book solution much better
10.times { |i| puts (" " * i) + "The Flintstones Rock!" }

# Question 2
# puts "the value of 40 + 2 is " + (40 + 2)
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{(40 + 2)}"

# Question 3
def factors(number)
  divisor = number
  factors = []
    while divisor > 0 do
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    end    
  factors
end

p factors(25)

# Question 4
=begin
First option is better.  It modifies the buffer in-place, it has lower space complexity and likely better performance
The first implementation mutates the original object argument, the second does not
=end

# Question 5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6
# => 34

# Question 7
# Yes, the method mutates the original hash

# Question 8
# paper

# Question 9
# no

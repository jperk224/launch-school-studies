# Problem
# print all the odd numbers from 0 to 99 inclusive
# each number should be on its own line

# Algorithm
# for range 0 to 99
# determine is the number is odd
# if the number is odd print it, else continue

# Code
# (0..99).each { |num| puts num if num % 2 != 0 }
# (0..99).to_a.select { |num| num.odd? }.each { |num| puts num }

##### even numbers #####
1.upto(99) { |num| puts num if num.even? }

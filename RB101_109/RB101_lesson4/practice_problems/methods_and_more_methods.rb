# Question 1
# [1, 2, 3] => the last expression in the block
# is truthy, therefore the block is true for every element in
# the colleciton, so a new array with every element is returned by the method

# Question 2
# How does count trat the block's return value?
# It looks to truthiness of the block, the method returns the count
# of the number of elements for which the block evaluates to true
# => 2

# Question 3
# Rejects returns a new array of elements where the block
# evaluates to 'false'
# puts returns nil whcih is false
# => [1, 2, 3]

# Question 4
# { 0 => [0, 'ant'], 1 => [1, 'bear'], 2 => [2, 'cat'] }
# Above is wring ^^
# {'a' => 'ant', 'b' => 'bear', 'c' => cat }

# Question 5
# hash.shift => [:a, 'ant']

# Question 6
# => 11; pop returns 'caterpillar', size returns the char count

# Question 7
# The block returns true/false based on whether number is odd
# any? returns true here because the calling colleciton has odd elements
# Output: true

# Question 8
# #take -> returns first n elements of an array as a new array
# non-destructive

# Question 9
# [nil, 'bear']

# Question 10
# [1, nil, nil]

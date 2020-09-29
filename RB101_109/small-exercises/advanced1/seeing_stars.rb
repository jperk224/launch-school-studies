# problem
  # take in an odd integer >= 7
  # print an eight pointed star in an n x n grid where n is the integer passed in as the argument


# ds/algo
# initialize a counter variable to 1
# increment counter in steps of 2 up to n
# decrement counter in steps of 2 back down to 1
# at each step print stars for that step

# examples

=begin
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
=end

# code
def print_stars(row_length, num_stars, end_spaces)
  spaces_between = (row_length - num_stars - (end_spaces * 2)) / (num_stars - 1)
    middle_stars = ('*' * num_stars).chars.join(' ' * spaces_between)
    "#{' ' * end_spaces}#{middle_stars}#{' ' * end_spaces}"
end

def star(n)
  star_array  = []
  counter = 1
  end_spaces = 0
  loop do
    star_array << print_stars(n, 3, end_spaces)
    break if counter >= n - 2
    counter += 2
    end_spaces += 1
  end
  star_array << '*' * (counter + 2)
  loop do
    star_array << print_stars(n, 3, end_spaces)
    break if counter <= 1
    counter -= 2
    end_spaces -= 1
  end
  puts star_array
end

star(21)

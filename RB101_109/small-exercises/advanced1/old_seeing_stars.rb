# problem
# take in an odd integer > 7
# display an 8-pointed star in an nxn grid


# ds/algo
# display_spaced_row
  # take in 3 arguments, n, s, and t
    # n is row length
    # s is space between stars
    # t is number of stars to be printed
  # set length of star_sub row equal to t + s * (t-1)
  # set end_length equal to (n - star_sub length) divided by 2
  # initialize star_sub_row equal to '*' concatenated with s spaces times (t-1)
  # append '*' to star_sub row
  # print end_lenth times spaces concatenated with star_sub_row concatenated with end_length spaces

# display_full_row
  # take in 1 argument, n
    # n is row length
    # print '*' n times

# star
# initialize counter set to n divided by two
# counter times
  # set num_spaces equal to n - (counter times 2) - number of stars (3) divided by 2
  # display_spaced row
  # increment counter
# display_full_row
# counter_times
  # set num_spaces equal to n - (counter times 2) - number of stars (3) divided by 2
  # decrement counter



require 'pry'

# code
def num_spaces(counter, num_stars)
  ((counter * 2) - num_stars) / 2
end

def display_spaced_row(row_length, num_spaces, num_stars)
  star_sub_row_length = num_stars + (num_spaces * (num_stars - 1))
  end_length = (row_length - star_sub_row_length) / 2
  sub_row = (('*' + (' ' * num_spaces)) * (num_stars - 1)) + '*'
  puts (' ' * end_length) + sub_row + (' ' * end_length)
end

def display_full_row(row_length)
  puts '*' * row_length
end

def star(n)
  counter = n / 2
  num_stars = 3
  (0..counter).each do |num|
    num_spaces = num_spaces(num, num_stars)
    display_spaced_row(n, num_spaces, num_stars)
  end
  display_full_row(n)
  loop do
    num_spaces = num_spaces(counter, num_stars)
    display_spaced_row(n, num_spaces, num_stars)
    counter -= 1
    break if counter < 1
  end
end

star(7)

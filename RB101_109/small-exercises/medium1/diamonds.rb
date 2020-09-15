# problem
# take in an odd integer --> safe to assume will be odd
# output a 4-point diamond in n x n grid


# examples



# ds/algo
# initialize an output_stars variable set to 1
# output number of stars equal to output_stars
# increment output_stars by 2
# output number of stars equal to output_stars
# repeat until output_stars is equal to n
# decrement output_stars by 2
# output number of stars equal to output_stars
# repeat until output_stars is equal to 1

# code
def output(num_stars, n)
  side_spaces = (n - num_stars) / 2
  puts "#{" " * side_spaces}#{"*" * num_stars}#{" " * side_spaces}"
end

def diamond(n)
  output_stars = 1
  side_spaces = ''
  # step up
  loop do
    output(output_stars, n)
    break if output_stars >= n
    output_stars += 2
  end
  if n > 1
    output_stars -= 2
    # step back
    loop do
      output(output_stars, n)
      break if output_stars <= 1
      output_stars -= 2
    end
  end
end

diamond(5)
# diamond(1)
diamond(3)
diamond(1)
diamond(11)

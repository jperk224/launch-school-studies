# understand the problem
=begin
- input => positive integer
- output => string of alternating 1s and 0s the length of the input, starting w/ 1
=end

# Examples/Test Cases
=begin
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(25) == '1010101010101010101010101'
puts stringy(0) == 'Please provide a number greater than zero'
puts stringy(-1) == 'Please provide a number greater than zero'
puts stringy(-1478) == 'Please provide a number greater than zero'
=end

# Data Structure(s)
=begin
- input => integer > 0
- output => string
=end

# Algorithms
=begin
- loop num times
- if num is even add 0 to string, if odd add 1 to string
=end

# Code
def stringy(num, lead = 1)

  if num <= 0
    return 'Please provide a number greater than zero'
  end

  string = ''
  if lead == 1
    num.times do |iteration_count|
      if (iteration_count + 1) % 2 != 0 # becasue iteration_count will start at zero
        string << '1'
      else
        string << '0'
      end
    end
  else  # lead = 0, start with 0
    num.times do |iteration_count|
      if (iteration_count + 1) % 2 != 0 # becasue iteration_count will start at zero
        string << '0'
      else
        string << '1'
      end
    end
  end
  return string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(25) == '1010101010101010101010101'
puts stringy(0) == 'Please provide a number greater than zero'
puts stringy(-1) == 'Please provide a number greater than zero'
puts stringy(-1478) == 'Please provide a number greater than zero'
puts stringy(6, 0) == '010101'

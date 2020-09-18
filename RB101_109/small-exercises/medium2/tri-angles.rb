# problem
# right - 90 deg
# acute - all 3 < 90
# obtuse - one angle > 90

# angle sum must be 180 to be a vlaid triangle
# all angles must be > 0

# assume int inputs that represent degrees


# examples
=begin
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
=end

# ds/algo
# is_valid?
# take in an angle array
# confirm all angles > 0 (i.e angles does not contain 0 or number less than 0)
# confirm sum is 180 (all angles elemnts sum to 180)

# is_right?
# take in an angle array
# check whether angle array has one and only 1 angle that is 90 degrees

# is_acute?
# take in an angle array 
# check whether all angles in array are less than 90

# triangle
# take in 3 angles
# put angles in angles_array
# check whether trianlge is valid
# if valid, check whether its right
# if not, check whether its acute
# if not its obtuse
# return triangle type

# code
def is_valid?(angles_array)
  return false if angles_array.any? { |angle| angle <= 0 }
  angles_array.sum == 180
end

def is_right?(angles_array)
  angles_array.count { |angle| angle == 90 } == 1
end

def is_acute?(angles_array)
  angles_array.all? { |angle| angle < 90 }
end

def triangle(deg1, deg2, deg3)
  angles_array = [deg1, deg2, deg3]
  return :invalid if !is_valid?(angles_array)
  if is_right?(angles_array)
    return :right
  elsif is_acute?(angles_array)
    return :acute
  else
    return :obtuse
  end
end

# p is_valid?(45,45,90) == true
# p is_valid?(0,90,90) == false
# p is_valid?(0,45,90) == false

# p is_right?([0,0,90]) == true
# p is_right?([0,90,90]) == false
# p is_right?([20,45,45]) == false
# p is_acute?([45,45,45]) == true
# p is_acute?([45,45,145]) == false
# p is_acute?([45,45,90]) == false
# p is_acute?([0, 0, 0]) == true


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

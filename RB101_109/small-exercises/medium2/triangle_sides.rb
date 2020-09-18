# problem
# equilateral - all 3 sides are of equal length
# isosceles - 2 sides are equal length
# scalene - all three sides are different

# to be valid
  # sum of the lengths of the two shortest sides > length of longest side
  # all sides must have lengths greater than zero

# take in 3 side lengths and return a symbol based on the triangle type


# examples
=begin
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
=end

# ds/algo
# is_valid_triangle?
# take in 3 sides
# put the ints into an array named sides
# check that none of the elements are zero
# sort sides
# check whether sum of first two elements GREATER THAN last element (last element is max and therefore longest side)


# is_equilateral_triangle?
# take in 3 ints
# check whether its a valid triangle
# check whether side 1 equals side 2 and side 2 equals side 3

# is_isosceles?
# take in 3 ints
# check whether side 1 equals side 2 or side 2 equals side 3 or side 1 equals side 3

# triangle
# take in 3 sides (ints)
# check to see if valid triangle
# if so check for equlateral
# if not check for isosoceles
# if not its a scalene
# return trianlge type

# code
def is_valid_triangle?(side1, side2, side3)
  sides = [side1, side2, side3]
  return false if sides.include?(0)
  sides.sort!
  sides[0..1].sum > sides[-1]
end

def is_equilateral_triangle?(side1, side2, side3)
  side1 == side2 && side2 == side3
end

def is_isosceles_triangle?(side1, side2, side3)
  side1 == side2 || side2 == side3 || side1 == side3
end

def triangle(side1, side2, side3)
  return :invalid if !is_valid_triangle?(side1, side2, side3)
  if is_equilateral_triangle?(side1, side2, side3)
    return :equilateral
  elsif is_isosceles_triangle?(side1, side2, side3)
    return :isosceles
  else
    return :scalene
  end
end

# p is_valid_triangle?(0, 3, 7) == false
# p is_valid_triangle?(1, 3, 7) == false
# p is_valid_triangle?(1, 2, 3) == false
# p is_valid_triangle?(2, 2, 3) == true
# p is_valid_triangle?(1, 1, 1) == true

# p is_equilateral_triangle?(2, 2, 2) == true
# p is_equilateral_triangle?(2, 2, 3) == false
# p is_equilateral_triangle?(2, 2, 7) == false
# p is_equilateral_triangle?(0, 2, 3) == false

# p is_isosceles_triangle?(1, 3, 1) == true
# p is_isosceles_triangle?(2, 3, 4) == false
# p is_isosceles_triangle?(0, 0, 0) == true

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

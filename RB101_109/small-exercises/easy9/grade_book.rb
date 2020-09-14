# problem
# take in three ints
# calculate the average of the 3
# return the letter associated with that grade
# 90 to 100 = A
# 80 to 89 = B
# 70 to 79 = C
# 60 to 69 = D
# 0 to 59 = F

# examples
# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# ds/algo
# calculate_grade
  # create a hash mapping the ranges to the letter value
  # map the float argument to the letter
  # return the letter grade

# get_grade
  # calculate the average of the three numbers provided
  # pass the average to calculate_grade
  # return the letter

# code
def calculate_grade(num)
  grade_map = {
    (90..100) => 'A',
    (80..89) => 'B',
    (70..79) => 'C',
    (60..69) => 'D',
    (0..59) => 'F'
  }
  letter_grade = ''
  grade_map.keys.each do |range|
    letter_grade = grade_map[range] if range.cover?(num)
  end
  letter_grade
end

def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  calculate_grade(average)
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

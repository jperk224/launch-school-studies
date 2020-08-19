# PEDAC
=begin
# Problem
- A lea
p year is (1) divisible by 4, (2) not divisible by 100 and (3) divisible by 400
- assume years greater than zero (i.e. no input validation)
  - mod operator can be used b/c both inputs are positive

# Examples/Test Cases
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

# Data Structure
Input: Integer
Output: Boolean
Rules: Logic

# Algorithm
1. Check whether the year is divisible by 4  # own method
  a. if not, return false
  b. if divisible by 4
    i. check whether year is divisible by 400 # own method
      A. true, return true
      B. if not, check whether divisible by 100 # own method
        1. if so return false
        2. else, return true
=end

# Code 
# Assume valid integer input to methods
def divisible_by_4?(integer)
  integer % 4 == 0
end

def divisible_by_100?(integer)
  integer % 100 == 0
end

def divisible_by_400?(integer)
  integer % 400 == 0
end

def leap_year?(integer)
  if divisible_by_400?(integer) # change from algorithm, best to start with least common cases first
    true
  else
    if divisible_by_100?(integer)
      false
    else
      divisible_by_4?(integer)
    end
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

p "********** PART 2 **********"

# Further exploration
# The rewrite will fail for years divisible by 400

# Starting w/ 4 first, then 100, then 400 is more complex because you're triggering more logic more often

# Part 2
# update the method from the previous exercise to determine leap years both before and after 1752.

def leap_year?(integer)
  if integer < 1752 && integer % 4 == 0
    return true
  elsif integer >= 1752
    if divisible_by_400?(integer) # change from algorithm, best to start with least common cases first
      true
    else
      if divisible_by_100?(integer)
        false
      else
        divisible_by_4?(integer)
      end
    end
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

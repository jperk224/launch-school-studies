# Problem
# Solicit 6 numbers from the user
# Tell the user whether the 6th number appears amongst the first 5

# Examples/Test Cases
# [25, 15, 20, 17, 23], 17 => Does appear
# [25, 15, 20, 17, 23], 18 => Does not appear
# [0, 0, 0, 0, 0], 0 => Does appear

# Data Structure
# Input: 6 integers
# Output: String with integer and array interpolation
  # - 5 element array for entires 1 -5
  # Integer for the last element
  # use a full aray w/ slicing

# Algorithm
# initialize an empty user_numbers array
# Get a number from the user
# add the number to the user_numbers array
# Repeat until 6 numbers are in the user_numbers array
# check to see if the last number in the array is included in the first 5
# Print a statement stating whether the number exists in the first 5

# Code
def last_in_previous?(arr)
  arr[0, arr.length - 1].include?(arr[-1])
end

def display_last_in_previous(arr)
  appears = 'does not appear'
  if last_in_previous?(arr)
    appears = 'appears'
  end
  puts "The number #{arr[-1]} #{appears} in #{arr[0, arr.length - 1]}"
end


def valid_integer?(str)
  str.to_i.to_s == str
end

cardinality_hash = {
  [1]       => "st",
  [2]       => "nd",
  [3]       => "rd",
  [4, 5, 6] => "th"
}

user_numbers = []
input_number = ''
6.times do |i|
  step_number = i + 1
  step_cardinality = ''
  cardinality_hash.each { |key, value| step_cardinality = cardinality_hash[key] if key.include?(step_number) }
  loop do
    puts "==> Enter the #{step_number.to_s + step_cardinality} number:"
    input_number = gets.chomp
    break unless input_number.empty? || !valid_integer?(input_number)    
  end
  user_numbers << input_number.to_i
end

display_last_in_previous(user_numbers)

# puts last_in_previous?([25, 15, 20, 17, 23, 17])
# puts last_in_previous?([25, 15, 20, 17, 23, 18])
# puts last_in_previous?([0, 0, 0, 0, 0, 0])

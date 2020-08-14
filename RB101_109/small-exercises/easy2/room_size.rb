# Problem
# prompt use for length and width of room in meters
# display the area in square meters and square feet
  # 1 square meter == 10.7639 feet
# input does not have to be validated at this time

# Data Structure
# Input: 2 integers
# Output: String
# Rules: logic


# Algorithm
# get room length in meters
# get room width in meters
# calculate square meters
# calculate square feet
# display result


# Code
def display_room_area(length, width)
  square_meters = (length * width).round(2)
  square_feet = (square_meters * 10.7639).round(2)
  puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."
end

puts "Enter the length of the room in meters:"
length = gets.chomp

puts "Enter the width of the room in meters:"
width = gets.chomp

display_room_area(length.to_f, width.to_f)

# Test Cases
# display_room_area(10, 7) #=> "The area of the room is 70.0 square meters (753.47 square feet)."

# PEDAC
=begin
# Problem
- From 00:00 Sunday morning (midnight b/t Saturday and Sunday)
- Get number of minutes
  - If positive advance forward (i.e. time is after midnight)
  - If negative advance backwards (i.e. time is before midnight)
- Return time of day and day of weey using Day HH:MM format
  - e.g. Thursday 01:29
- Use Date and Time Classes

# Examples/Test Cases
time_of_day(-4231) == 'Thursday 01:29'
time_of_day(0) == 'Sunday 00:00'
time_of_day(3600) == 'Tuesday 12:00'

# Data Structures
Input: Integer
Output: String
Rules: Logic, Time classes

# Algorithms
1. Convert the minute argument to a time delta
2. Add/Subtract time delta from Sunday 00:00

# Detemrine Time Delta
1. Time shoudl be in seconds to word with Time class


=end
# Code

def time_delta(integer)
  integer * 60
end

def time_of_day(minutes)
  base = Time.new(2020, 8, 16)
  result = base + time_delta(minutes)
  result.strftime("%A %H:%M")

end

p time_of_day(-4231) == 'Thursday 01:29'
p time_of_day(0) == 'Sunday 00:00'
p time_of_day(3600) == 'Tuesday 12:00'

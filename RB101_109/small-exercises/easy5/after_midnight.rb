# PEDAC
=begin
# Problem
- Take in an integer input that represents minutes from midnight (00:00)
  - if > zero - time is after midnight
  - if < zero - time is before midnight
- Return a string representing the time in HH:MM 24-hour format (e.g. 14:27)

# Examples/Test Cases
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

# Data Structure
Input: Integer
Output: String
Rules: Logic

# Algorithm
1. Get the time delta
2. Add it to 00:00 if argment is positive, subtract if negative

=end
# Code
def minutes_to_time_delta(integer)
  integer *= -1 if integer < 0
  hours, minutes = integer.divmod(60)
  hours %= 24 if hours >= 24
  [hours, minutes]
end

def time_of_day(integer)
  hours_delta, minutes_delta = minutes_to_time_delta(integer)
  case integer <=> 0
  when -1 
    if minutes_delta > 0
      hours = 23 - hours_delta
      minutes = 60 - minutes_delta 
    else
      hours = 24 - hours_delta
      minutes = 0
    end
  else
    hours = 0 + hours_delta
    minutes = 0 + minutes_delta
  end

  hours = "0#{hours.to_s}" if hours < 10
  minutes = "0#{minutes.to_s}" if minutes < 10
  
  "#{hours}:#{minutes}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
p time_of_day(-600) == "14:00"

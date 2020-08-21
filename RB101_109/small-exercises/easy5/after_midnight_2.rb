# PEDAC
=begin
# Problem
- write two methods that each take in a string representing time in 24-hour format
  - one returns number of minutes before midnight
  - other returns number of minutes after midnight

# Examples/Test Cases
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0


# Data Structures
Input: String
Output: Integer
Rules: ?

# Algorithms
### BEFORE
1. Split the input into an array with hour and minute
2. 


### AFTER
1. Split the input into an array with hour and minute
2. Convert the hour element to minutes if under 24, else 0
3. Sum the elements in the array


=end
# Code
def delta_minutes(string)
  delta_array = string.split(':').map { |str| str.to_i }
  if delta_array[0] < 24
    delta_array[0] *= 60
  else
    delta_array[0] = 0
  end
  delta_array.sum
end

def after_midnight(string)
  delta_minutes(string)
end

def before_midnight(string)
  time_array = string.split(':')
  time_array[0] = (23 - time_array[0].to_i).to_s unless time_array[0].to_i == 0 || time_array[0].to_i == 24
  time_array[1] = (60 - time_array[1].to_i).to_s unless time_array[1].to_i == 0 || time_array[1].to_i == 60
  new_time = time_array.join(':')
  delta_minutes(new_time)
end

# p time_array('00:00') == [0,0]
# p time_array('24:00') == [24,0]
# p time_array('12:34') == [12,34]

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
p after_midnight('2:45') == 165
p before_midnight('2:45') == 1275

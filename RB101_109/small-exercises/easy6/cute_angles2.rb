# problem
# take in a float between 0 and 360 degrees
# return a string
  # angle in degrees, minutes, seconds
    # degree symbol represents degrees, `'` for minutes, `"` for seconds
  # use two digit numbers with leading zeros


# examples
=begin
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

# ds/algo
# set degrees to floor of the float argument
# subtract floor from argument to get decimal portion
# set minute_product to product of decimal portion by 60 
# set minutes to floor of the product
# subtract minutes from minute_product to get decimal portion
# set seconds_product to product of decimal by 60
# set minutes, seconds to leading_zeros() output
# interpotale output_string string with degrees, minutes, seconds
# return output_string

# leading zeros
# check if string as int is less than 10
# if so return '0' + num_str
# else return num_str

# code
DEGREE = "\xC2\xB0"
MINUTES = "'"
SECONDS = '"'

def leading_zeros(string)
  if string.to_i < 10
    '0' + string
  else
    string
  end
end

def dms(float)
  degrees = float.floor
  remaining_decimal = float - degrees
  minute_product = remaining_decimal * 60
  minutes = minute_product.floor
  remaining_decimal = minute_product - minutes
  seconds_product = remaining_decimal * 60
  seconds = seconds_product.floor
  minutes = leading_zeros(minutes.to_s)
  seconds = leading_zeros(seconds.to_s)
  "#{degrees}#{DEGREE}#{minutes}#{MINUTES}#{seconds}#{SECONDS}"
end


p dms(254.6) #== %(254°36'00")
# PEDAC
=begin
- Take in a string of digits and return as Integer
  - cannot use Integer() to #to_i
- Assume all numeric characters

string_to_integer('4321') == 4321
string_to_integer('570') == 570

Input: String; Output: Integer

Algo:
split the string into an array
for each elemtn in the array, use bracnhing logic to conver to numric equivalent
join the array back 
return the integer
=end

def string_to_integer(str)
  loop do
    break if str[0] != '0'
    str = str[1, str.length - 1] if str[0] == '0'
  end
  digit_array = str.chars
  places = digit_array.length
  sum = 0
  digit_array.each do |char|
    case char
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    end
  end  
end

p string_to_integer('012345')
p string_to_integer('00012345')
# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

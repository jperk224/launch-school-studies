# problem
# take in a string modeled as "<first name> <last name>"
# return a NEW string modeled as "<last name>, <first name>"

# examples
# p swap_name('Joe Roberts') == 'Roberts, Joe'
# p swap_name('') == ''


# ds/algo
# convert the string into a two element array
# interpolate a new string with last element, first element
# return new string

# code
def swap_name(str)
  str_array = str.split
  if str_array.length > 1
    "#{str_array.last}, #{str_array.first}"
  elsif str_array.length > 0
    "#{str_array.first}"
  else
    ""
  end
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name('') == ''
p swap_name(' ') == ''

require 'pry'

def joinor(array, delimeter=', ', join_word='and')
  last_element = array[-1]
  if array.length == 0
    ""
  elsif array.length == 1
    last_element.to_s
  else
    sliced_array = array.slice(0, array.length - 1)
    "#{sliced_array.join(delimeter)} #{join_word} #{last_element}"
  end
end

p joinor([1])
p joinor([1, 2])
p joinor([1, 4, 5, "Queen"])

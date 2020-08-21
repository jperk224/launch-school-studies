arr = ['10', '11', '9', '7', '8']
p (
  arr.sort do |str1, str2|
    str2.to_i <=> str1.to_i
  end
)

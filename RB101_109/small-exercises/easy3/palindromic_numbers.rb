def palindromic_number?(num)
  num_as_string = num.to_s
  num_as_string == num_as_string.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

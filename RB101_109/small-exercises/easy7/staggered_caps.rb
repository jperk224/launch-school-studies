=begin
# problem
- take a string as argument
- return a NEW string of the orignal value
  - every other character is capitalized
  - non-alpha letters should not be changed, but included in the switch count

# examples
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('') == ''
p staggered_case(' ') == ' '
p staggered_case('abcdefg') == 'AbCdEfG'

# data structure
input: string
output: string

# algorithm(s)
- break the string into an array
- iterate over it
- if the index is even and it's a letter, convert it to uppercase
=end
# code
# def staggered_case(string)
#   staggered_array = []
#   string.chars.each_with_index do |char, index|
#     if char.match?(/[a-z]/i) && index.even?
#       staggered_array << char.upcase
#     elsif char.match?(/[a-z]/i) && index.odd?
#       staggered_array << char.downcase
#     else
#       staggered_array << char
#     end
#   end
#   staggered_array.join
# end

def staggered_case(string, first_char_downcase = false)
  result = ''
  need_upper = true
  need_upper = false if first_char_downcase
  string.chars.each do |char|
    if char.match?(/[a-z]/i)
      result += char.upcase if need_upper
      result += char.downcase if !need_upper
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('I Love Launch School!', true) == 'i lOvE LaUnCh sChOoL!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# p staggered_case('') == ''
# p staggered_case(' ') == ' '
# p staggered_case('abcdefg') == 'AbCdEfG'
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# problem
# take in an array of strings
# return a NEW array
  # same string values, vowels removed


# examples
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# ds/algo
# input - array
# output NEW array
# initialize an empty array result
# iterate over the argument array
  # convert the individual string to a vowelless string
  # inject it into result
# repeat for eavery sting in argument array
# return result

# code
def remove_vowels(arr)
  arr.map do |string|
    string.gsub(/[aeiuoAEIUO]/, '')
  end
end

p remove_vowels(%w(BC DD ZZ)) == ['BC', 'DD', 'ZZ']
p remove_vowels(%w(BCDDZZ)) == ['BCDDZZ']
p remove_vowels(%w()) == []
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)

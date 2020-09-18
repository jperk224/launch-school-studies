# problem
# spelling blocks have 2 letters, meaning you can only use one letter form each block to spell
# return true if the word passed in can be spelled from the set of blocks


# examples
=begin
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
=end

# ds/algo
# initalize a hash pairing the letter blocks together
# convert the string argument into an array of characters
# run each character through the conditional
  # If char is a hash value, does the char arry inclue its key?
    # if so, return false
  # if char is a key, does char arry include its value?
    # if so, return false


# code

LETTER_BLOCKS = {
  'B' => 'O',
  'X' => 'K',
  'D' => 'Q',
  'C' => 'P',
  'N' => 'A',
  'G' => 'T',
  'R' => 'E',
  'F' => 'S',
  'J' => 'W',
  'H' => 'U',
  'V' => 'I',
  'L' => 'Y',
  'Z' => 'M'
}

def block_word?(string)
  is_block = true
  char_array = string.chars
  char_array.each do |char|
    char.upcase!
    if LETTER_BLOCKS.keys.include?(char) && char_array.include?(LETTER_BLOCKS[char])
      is_block = false
    end
    if LETTER_BLOCKS.value?(char) && char_array.include?(LETTER_BLOCKS.key(char))
      is_block = false
    end
  end
  is_block
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
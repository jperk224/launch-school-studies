# problem
# read the contents of a text file
# output the longest sentence based on the number of words
# print the number of woords the the sentence
  # sentences may end with periods, bangs, or question marks


# examples



# ds/algo
# initialize an array that holds sentence terminators called terminators
# initalize an empty array sentences
# convert the text into an array of characters
# iterate through each character until a terminator is found
# slice the string from 0 up to and including the index of the terminator
# append sentences with the sliced sentence without the terminator
# repeat until all sentences have been sliced out (i.e. length of string is zero)
# find the longest sentence in sentences
# output the sentence and its length

# code

TERMINATORS = ['.', '!', '?']

def sentences(text)
  sentences = []
  until text.length == 0
    sentence = ''
    text.chars.each_with_index do |char, index|
      if TERMINATORS.include?(char)
        sentences << text.slice!(0..index).slice(0..-2).strip
        break
      end
    end
  end
  sentences
end

def longest_sentence(text)
  sentences = sentences(text)
  sentence_arrays = sentences.map { |sentence| sentence.split }
  longest_sentence = sentence_arrays[0]
  (1...sentence_arrays.length).each do |index|
    length = sentence_arrays[index].length
    longest_sentence = sentence_arrays[index] if length >= longest_sentence.length
  end
  longest_sentence
end

def print_longest_sentence(text)
  longest_sentence = longest_sentence(text)
  length = longest_sentence.length
  puts "The longest sentence is: '#{longest_sentence.join(' ')}' at #{length} words."
end

print_longest_sentence('Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.')

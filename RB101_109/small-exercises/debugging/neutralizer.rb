def neutralize(sentence)
  words = sentence.split(' ')
  non_negatives = []
  words.each do |word|
    non_negatives << word unless negative?(word)
  end

  non_negatives.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game

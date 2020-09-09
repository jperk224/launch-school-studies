# problem
# input a noun, verb, adjective, adverb
# ouput a sting with the user input interpolated

# examples/tests
# p madlibs('dog', 'walk', 'blue', quickly') == "Do you walk your blue dog quickly? That's hilarious!"


# ds/algo
# get user input for each word needed
# output the story sting with the input interpolated

# code
def madlibs(noun, verb, adjective, adverb)
  "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

p madlibs('dog', 'walk', 'blue', 'quickly') == "Do you walk your blue dog quickly? That's hilarious!"

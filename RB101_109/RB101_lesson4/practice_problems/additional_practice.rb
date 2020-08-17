p "##### Problem 1 #####"
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# First approach
p (flintstones.each_with_object({}) do |element, hash|
  hash[element] = flintstones.index(element)
end)

# second approach
counter = 0
hash = {}
loop do
  break if counter >= flintstones.size
  hash[flintstones[counter]] = counter
  counter +=1
end

p hash

# third approach
hash = {}
flintstones.each_with_index do |value, idx|
  hash[value] = idx
end

p hash

p "##### Problem 2 #####"
# add up all the ages
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# First approach
p ages.values.reduce(:+)

# Second approach
sum = 0
ages.each do |key, value|
  sum += value
end
p sum

p "##### Problem 3 #####"
# Remove people age 100 or greater
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# First Approach
p (ages.select do |key, value|
  value < 100  
end)

# Second Approach
p (ages.reject do |key, value|
  value >= 100
end)

p "##### Problem 4 #####"
# Pick out the minium age
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# First Approach
min_age = []
ages.each do |key, value|
  if value == ages.values.min
    min_age = [key, value]  
  end
end

p min_age

# Second Approach
p ages.values.min

p "##### Problem 5 #####"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# First Approach
p flintstones.index { |string| string[0,2] == 'Be'}

# Second Approach (general iteration using #each)
index = 0
flintstones.each_with_index do |element, idx|
  if element[0,2] == 'Be'
    index = idx
    break
  end
end
p index

p "##### Problem 6 #####"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# first approach (map) (non-destructive)
p(flintstones.map { |element| element = element[0,3] })
# map can also be destructve (map!)

# second approach (destructive loop)
flintstones.each { |element| element.gsub!(element, element[0,3]) }
p flintstones

p "##### Problem 7 #####"
# Create a hash that expresses the frequency which each letter occurs within the string
statement = "The Flintstones Rock"

# first approach
count_hash = statement.gsub(' ','').chars.each_with_object({}) do |char, hash|
  if hash[char]
    hash[char] += 1
  else
    hash[char] = 1
  end
end
p count_hash

# second approach
count_hash = {}
letter_array = ('A'..'Z').to_a + ('a'..'z').to_a
letter_array.each do |letter|
  letter_count = statement.scan(letter).count
  count_hash[letter] = letter_count if letter_count > 0
end
p count_hash

p "##### Problem 8 #####"
# => 1 3
##################
# => 1 2

p "##### Problem 9 #####"
words = "the flintstones rock"
words= words.split(' ').each { |word| word.capitalize! }.join(' ')
p words

# generic loop
counter = 0
words = "the flintstones rock"
array = words.split(' ')
capped_words = []
loop do
  break if counter >= array.length
  capped_words[counter] = array[counter].capitalize
  counter += 1
end
capped_words = capped_words.join(' ')
p capped_words

p "##### Problem 10 #####"
# Modify the below hash so that each member has an additional 'age_group' attribute
# one of three values (kid adult senior)
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  if (0..17).cover?(value["age"])
    value["age_group"] = "kid"
  elsif (18..64).cover?(value["age"])
    value["age_group"] = "adult"
  else 
    value["age_group"] = "senior"
  end
end
p munsters

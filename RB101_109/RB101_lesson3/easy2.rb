# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.keys.include?('Spot')
p ages.has_key?('Spot')
p ages.member?('Spot')
p ages.include?('Spot')
p ages.key?('Spot')

# Question 2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.match?('Dino')
p advice =~ / Dino /

# Question 5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones == flintstones2

# Question 6
flintstones2 << 'Dino'
p flintstones2

# Question 7
flintstones.push('Dino', 'Hoppy')
p flintstones

# Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
# advice = advice.slice!(39, 33)
p advice.slice!(0, advice.index('house'))
p advice

# Question 9
statement = "The Flintstones Rock!"
p statement.count('t')

# Question 10
title = "Flintstone Family Members"
p title.center(40)

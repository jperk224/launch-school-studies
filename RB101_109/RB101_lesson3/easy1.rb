# Question 1
=begin
1
2
2
3
=end

# Question 2
=begin
! is the NOT operator
? customarily returns a boolean based on whether some condition is met i.e. the quesiton being asked by the method
1.  != => not equals -> used in conditional logic
2.  !User_name will return false, or an error if the variable does not exist of true is user_name is false or nil, it negates
    the true/false value of the variable
3.  words.uniq! will mutate the caller instead of returning a new instance of the object
4.  put ? before something the something will be the true condition in a ternary statement
5.  put ? after something the something will be the expression evaluated to detemrine true/false of the ternary statement
6.  !!user_name will return true if the variable exists and is not set to false or nil, false otherwise; it negates the negation
=end

# Question 3
advice = "Few things in life are as important as house training your per dinosaur"
# advice[advice.index('important'), 9] = 'urgent'
advice.gsub!('important', 'urgent')
puts advice

# Question 4
=begin
numbers.delete_at(1) => removed element at index 1 => 2
numbers.delete(1) => removes elements with value 1 (index 0 in this case)
=end

# Question 5
puts (10..100).cover?(42)

# Question 6
famous_words = "seven years ago..."

puts "Four score and " + famous_words
puts "Four score and " << famous_words

# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!
p flintstones

# Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# barney_array = flintstones.to_a[2]
p flintstones.assoc('Barney')

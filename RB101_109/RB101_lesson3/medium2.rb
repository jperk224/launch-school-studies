=begin
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # 42 / 85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." # "forty two" / 180
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." # [42] / 200
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." # 42 / 85
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # 85 / 85 
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # 180 /  180
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # 200 /  200
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # 85 /  85
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # 22 / 85 / 45 
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # "thirty three" / 180 / 220
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # [44] / 200 / 240
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." # 44 / 85 / 89
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." # 22 / 85 / 45 
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." # "thirty three" / 180 / 220
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." # [44] / 200 / 240
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." # 44 / 85 / 89
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block." # 22 / 85 /45
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block." # "thirty three" / 180 / 220
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block." # [44] / 200 / 240
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block." # 44 / 85 / 89
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhh
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhh
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhh
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhh
end

fun_with_ids()
=end

# Question 3
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]
# The method mutates the array but reassigns the string

# Question 4
# pumpkinsrutabaga
# ["pumpkins"]
# The method mutates the string, but reassings the array

# Question 5
# a_string_param = a_string_param + "rutabaga"
# an_array_param.append("rutabaga")

# Question 6
def color_valid(color)
  color == 'blue' || color == 'green'
end

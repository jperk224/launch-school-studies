=begin
# problem
- take in a positive integer n, as an argument
  - safe to assume int will be positive, no validaiton needed
- display a right triangle whose sides each have n stars
- hypotenuse should slope to the right north of east


# examples/test cases



# data structure(s)
Input: integer
Output: ASCII characters
Rules: logic/loops

# algorithm(s)
- set counter equal to 1
- print '*' counter times with a line break
- increase the counter by 1
- repeat n times
=end

# code
# def triangle(int)
#   int.times do |num|
#     puts "#{' ' * (int - (num + 1))}#{'*' * (num + 1)}"
#   end
# end

# upside down ##
def triangle(int, slope_direction)
  case slope_direction
  when 'northeast'
    spaces = int - 1
    stars = 1
    int.times do
      puts "#{' ' * spaces}#{'*' * stars}"
      spaces -=1
      stars +=1
    end
  when 'northwest'
    spaces = int - 1
    stars = 1
    int.times do
      puts "#{'*' * stars}#{' ' * spaces}"
      spaces -=1
      stars +=1
    end
  when 'southwest'
    spaces = 0
    stars = int
    int.times do
      puts "#{'*' * stars}#{' ' * spaces}"
      spaces +=1
      stars -=1
    end
  when 'southeast'
    spaces = 0
    stars = int
    int.times do
      puts "#{' ' * spaces}#{'*' * stars}"
      spaces +=1
      stars -=1
    end
  end
end

triangle(5, 'northeast')
triangle(5, 'northwest')
triangle(5, 'southeast')
triangle(5, 'southwest')

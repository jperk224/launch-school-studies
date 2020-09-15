# problem
# bank of switches 1 to n
# take one argument n --> total switches
# return an array that identifies which lights are on after n repetitions


# examples
# p lights(5) == [1,4]
# p lights(10) == [1, 4, 9]


# ds/algo
# initialize an outer array lights
  # each inner array is a count, 1 - n paried with bool value initialized to true
# initialize a counter to 2
# for each light divisible by counter, flip the flag
# incremnet the counter
# repeat n times
# return an array of light numbers with flag that is 'true' 

# code
def lights(n)
  lights = []
  n.times do |int|
    lights << [(int + 1), true] # all lights on after round 1
  end
  counter = 2
  loop do
    break if counter > n
    lights.each do |light_array|
      light_array[1] = !light_array[1] if light_array[0] % counter == 0
    end
    counter += 1
  end
  result = lights.map do |light_array|
    light_array[0] if light_array[1]
  end.select do |light|
    light != nil
  end
end

p lights(5) == [1,4]
p lights(10) == [1, 4, 9]
p lights(8) == [1, 4]
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

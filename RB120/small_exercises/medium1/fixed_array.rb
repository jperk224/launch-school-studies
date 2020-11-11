# problem
# fixed length array always has a fixed number of elements
# write a class that implements a fixed-length array



# data structure/algorithm
# initialize method
  # take in an int 
  # set @length = int argument
  # set @array = @length elements that are all 'nil'

# [] (element getter)
  # take in an int
  # return IndexError if int > (@length - 1)
  # return the element from @array ar int index

# []= (element setter)
  # take in an int and a value
  # return IndexError if int > (@length - 1)
  # set the @array element at index int to value

# to_a
  # return @array

# to_s
  # return @array.to_s


# code
class FixedArray
  def initialize(length)
    @length = length
    @array = [nil] * length
  end

  def [](idx)
    # raise IndexError.new if idx > (@length - 1)
    array[idx]
  end

  def []=(idx, value)
    # raise IndexError.new if idx > (@length - 1)
    array[idx] = value
  end

  def to_a
    array
  end

  def to_s
    array.to_s
  end

  private

  attr_reader :array
end



# examples
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  p fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  p fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  p fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
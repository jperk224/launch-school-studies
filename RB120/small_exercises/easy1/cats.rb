class Pet
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur"
  end
end

# add a @color instance variable, set to the color passed into the constructor
# define getters for all 3 instance variables
# define a to_s method to override the standard object to_s
  # put the string from the example, interpolating the results from the getter of each instance variable


pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

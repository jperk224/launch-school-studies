# define a class Transform
  # constructor takes in a string
  # lowercase is a class method
  # uppercase is an instance method

# define the class
# define a private getter for @string instance variable
# define the constructor - takes in a string and intializes instance variable @string

# uppercase
# return the string instance variable in uppercase form

# lowercase (class method)
# take in a string and return it in lowercase form

class Transform
  
  def self.lowercase(string)
    string.downcase
  end
  
  def initialize(string)
    @string = string
  end

  def uppercase
    string.upcase
  end

  private

  attr_reader :string
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

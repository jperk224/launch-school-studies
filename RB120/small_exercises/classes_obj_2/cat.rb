class Cat
  # class methods
  def self.generic_greeting # self is preferred when defining class methods
    puts "Hello! I'm a Cat!"
  end

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    self.name = name
  end

  def identify
    self
  end
end

kitty = Cat.new("Sophie")
p kitty.identify

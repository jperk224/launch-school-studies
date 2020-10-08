# create a super Mammal class that person, cat, and cheetah inherit from
  # define constructor with name parameter
    # assign @name ivar to name argument passed in
  
  # define a walk method
    # return a string interpolated with the object's name, its gait, and `forward`

  # define a gait method with just the stub (will be overridden in subclasses)

class Mammal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def walk
    "#{name} #{gait} forward"
  end

  private

  def gait
  end
end

class Person < Mammal
  private

  def gait
    "strolls"
  end
end

class Cat < Mammal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Mammal
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

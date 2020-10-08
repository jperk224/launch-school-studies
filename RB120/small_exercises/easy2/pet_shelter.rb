class Owner
  def initialize(name)
    @name = name    
  end
end

class Pet
  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Shelter
  attr_accessor :owners, :pet

  def adopt(owner, pet)
    self.owner = owner
    self.pet = pet
  end

  def print_adoptions
    
  end
end

# ds / algo
# 3 classes - Pet, Owner, Shelter

# Pet class
# define a constructor that takes a pet_type and a name; both are strings
  # initializes 2 instance variables- @pet_type, @name

# Owner class
# define a constructor that takes in a string
  # initialize instance variable @name to the string passed into the constructor
  # initialize an instance variable @pets set to an empty array to hold pet objects
# number of pets method
  # return the count of pet objects in @pets array

# Shelter class
  # define a constructor with no parameters
    # initialize an instance variable @owners set to an empty array to hold owner objects
  # adopt method
    # take in an owner object and a pet object
    # append the @pets array under the owner with the pet object passed in
    # append the @owners array in the shelter object with the owner passed in if it does not exist
  # print adoptions
    # iterate over @owners
      # print the output of each pet in each owner's @pets array per the output provided

class Pet
  attr_reader :pet_type, :name

  def initialize(pet_type, name)
    @pet_type = pet_type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []    
  end

  def number_of_pets
    pets.length
  end
end

class Shelter
  attr_reader :owners
  
  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    owners << owner if !owners.include?(owner)
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.pet_type} named #{pet.name}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

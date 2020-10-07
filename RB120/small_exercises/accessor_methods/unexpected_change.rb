class Person
  attr_accessor :first_name, :last_name

  def name=(name)
    self.first_name = name.split[0]
    self.last_name = name.split[1]
  end

  def name
    first_name + ' ' + last_name
  end

end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name

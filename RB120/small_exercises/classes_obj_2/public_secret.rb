class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = "Shh. This is a secret!"
puts person1.secret

class Person
  attr_writer :secret # setter

  def compare_secret(person)
    self.secret == person.secret
  end

  protected

  attr_reader :secret # getter
end

person1 = Person.new
person1.secret = "Shh.. This is a secret!"
person2 = Person.new
person2.secret = "Shh.. This is a different secret!"

puts person1.compare_secret(person2)

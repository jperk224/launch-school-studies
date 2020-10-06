class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end
  
  def better_grade_than?(other)
    self.grade > other.grade
  end

  protected
  
  attr_accessor :grade
end

joe = Student.new('joe', 98)
bob = Student.new('bob', 97)

puts "Well done!" if joe.better_grade_than?(bob)

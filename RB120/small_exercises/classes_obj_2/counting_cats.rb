class Cat
  @@number_of_cats = 0

  def self.total
    puts @@number_of_cats
  end

  def initialize
    @@number_of_cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
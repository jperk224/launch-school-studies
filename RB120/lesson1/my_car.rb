module Towable
  def tow
    puts "This truck can haul some serious cargo."
  end
end

class Vehicle
  @@number_of_vehicles = 0
  
  def self.gas_mileage(miles_driven, gallons_of_gas)
    miles_driven / gallons_of_gas
  end

  def self.print_vehicle_count
    puts @@number_of_vehicles
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  attr_accessor(:current_speed, :color)
  attr_reader(:year, :model)

  def print_speed
    puts "You are going #{current_speed} mph."
  end

  def accelerate(number)
    @current_speed += number
    self.print_speed
  end

  def break
    @current_speed -= number
    self.print_speed
  end

  def power_off
    @current_speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def print_age
    puts "The vehicle's age is #{age} years."
  end

  private 

  def age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  VEHICLE_TYPE = 'car'

  def to_s
    "Hello, this is my car. Year is #{self.year}, color is #{self.color}, model is #{self.model}."
  end
end

class MyTruck < Vehicle
  VEHICLE_TYPE = 'truck'

  include Towable

  def to_s
    "Hello, this is my truck. Year is #{self.year}, color is #{self.color}, model is #{self.model}."
  end
end

Vehicle.print_vehicle_count

my_car = MyCar.new(1997, "Black", "Tahoe")
p my_car.color
my_car.print_speed
my_car.accelerate(101)
p MyCar.gas_mileage(30, 6)
puts my_car

my_truck = MyTruck.new(2001, "Red", "GMC")
p my_truck.color
my_truck.print_speed
my_truck.accelerate(201)
p MyTruck.gas_mileage(40, 2)
puts my_truck

my_truck.tow

Vehicle.print_vehicle_count

# car method lookup path
p MyCar.ancestors

# truck method lookup path
p MyTruck.ancestors

# vehicle method lookup path
p Vehicle.ancestors

my_truck.print_age
my_car.print_age

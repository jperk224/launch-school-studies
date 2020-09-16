# problem
# write a mini stack-and-register program
# Has the following commands
  # `N` places value `n` int the register without modifying stack
  # `PUSH` - push the register value to the stack, leave the value in the register
  # `ADD` - pops a value from the stack, adds it to register value, stores result in register
  # `SUB` - pops a value from the stack, subtracts it from the register value, stores result in register
  # `MULT` - pops a value from the stack, multiplies it by the register value, stores result in register
  # `DIV` - pops a value from the stack, divides it into the register value, stores the integer result in register
  # `MOD` - pops a value from the stack, divides it into the register value, stores the integer remainder in register
  # `POP` - remove the topmost item from the stack and place in register
  # `PRINT` - Print the register value
# initialize the register to 0


# examples
=begin
  
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
  
=end

# ds/aglo
# initialize variable register to 0
# initialize an empty stack array
# convert the string argument into an array of substrings to iterate over the input
# for each substring, detemrine whether its an integer or not
  # if integer, set register equal to integer
  # if not integer, map it to the appropriate method call and invoke the method 


# individual methods
# 


# code
require 'pry'

# use to determine whether a substring is an integer
def integer?(str)
  str.to_i.to_s == str
end

def push(register, stack)
  stack.push(register)  
end

def add(register, stack)
  register + stack.pop
end

def sub(register, stack)
  register - stack.pop
end

def mult(register, stack)
  register * stack.pop
end

def div(register, stack)
  register / stack.pop
end

def mod(register, stack)
  register % stack.pop
end

def pop(stack)
  stack.pop
end

def print(register)
  p register
end

def invoke_method(str, register, stack)
  success = true
  case str.upcase
  when 'PUSH'
    push(register, stack)
  when 'ADD'
    register = add(register, stack)
  when 'SUB'
    register = sub(register, stack)
  when 'MULT'
    register = mult(register, stack)
  when 'DIV'
    register = div(register, stack)
  when 'MOD'
    register = mod(register, stack)
  when 'POP'
    register = pop(stack)
  when 'PRINT'
    print(register)
  else
    success = false
  end
  [register, success]
end

def minilang(command)
  register = 0
  stack = []
  success = true
  command_array = command.split
  command_array.each do |substr|
    if integer?(substr)
      register = substr.to_i
    else
      register, success = invoke_method(substr, register, stack)
    end
    if !success
      puts "Error, unknown command."
      break
    end
  end
end

# minilang('PRINT')
# minilang('5 PUSH 3 ADD PRINT') #=> 15
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT') #=> 5 3 8
# minilang('5 PUSH POP PRINT') # => 5
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # => 5 10 4 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # => 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # => 12

minilang('-3 PUSH 5 SUB PRINT') # => 8

minilang('6 PUSH') # (nothing printed; no PRINT commands)

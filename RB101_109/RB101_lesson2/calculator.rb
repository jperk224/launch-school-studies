=begin
Build a command line calculator program that does the following:

asks for two numbers
asks for the type of operation to perform: add, subtract, multiply or divide
displays the result
=end

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operaiton of the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

# regex is not used due to 'edge' cases

def integer?(str)
  # /^\d+$/.match(str)
  str.to_i.to_s == str
end

def float?(str)
  # /\d/.match(str) && /^\d*\.?\d*$/.match(str)
  str.to_f.to_s == str
end

def number?(str)
  integer?(str) || float?(str)
end

def operation_to_message(op)
  message = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  # additinal code goes here
  message
end

prompt(MESSAGES["welcome"])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES["name_error"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES["number_one_prompt"])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES["number_two_prompt"])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["operation_error"])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers... ")

  result =  case operator
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()
            end

  prompt("The results is #{result}")

  prompt(MESSAGES["calculate_again"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using calculator.  Good bye!")

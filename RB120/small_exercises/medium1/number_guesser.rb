=begin
# problem
# ds/algo
# GuessingGame class
  # initialize constant NUMBER_OF_GUESSES to 7
  # initialize constant RANGE_LOW to 1
  # initialize constant RANGE_HIGH to 100

  # play method
    # set instance varible @secret_number to random int between RANGE_LOW and RANGE_HIGH
    # set instance_variable @remaining_guesses to NUMBER_OF_GUESSES
    # while there are remaining guesses
      # prompt the user to enter a number between RANGE_LOW and RANGE_HIGH
        # validate input to ensure its an int within the range
        # instantiate a new guess object using user-validate input as argument
  # check_guess
    # if guess == @secret_number
      # prompt correct guess
    # else
      # incorrect_guess
  # incorrect_guess
    # decrement @remaining_guesses by 1
    # prompt 'wrong guess'

# Guess class
  # constructor
    # take in an int as argument
    # set instance variable @value eual to the int argument provided

  # == method
    # take in a number as an argument
    # return whether guess instanve @value == number provided

# code
=end
class Guess
  attr_accessor :value

  def initialize(number)
    @value = number
  end

  def ==(number)
    value == number
  end

  def >(number)
    value > number
  end

  def <(number)
    value < number
  end
end

class GuessingGame
  NUMBER_OF_GUESSES = 7
  RANGE_LOW = 1
  RANGE_HIGH = 100

  def play
    self.secret_number = rand(RANGE_LOW..RANGE_HIGH)
    self.remaining_guesses = NUMBER_OF_GUESSES
    self.guess = Guess.new(0)
    guess_instances
  end

  private

  def single_guess
    puts "You have #{remaining_guesses} guesses remaining."
    user_input = user_guess
    guess.value = user_input
  end

  def guess_instances
    while remaining_guesses > 0
      single_guess
      if correct_guess
        puts "That's the number!"
        return
      end
      print_high_or_low
      self.remaining_guesses -= 1
    end
    puts "You have no more guesses. You lost!"
  end

  def user_guess
    puts "Enter a number between #{RANGE_LOW} and #{RANGE_HIGH}:"
    user_input = gets.chomp.to_i
    loop do
      break if (RANGE_LOW..RANGE_HIGH).cover?(user_input)
      puts "That is not valid input."
      puts "Enter a number between #{RANGE_LOW} and #{RANGE_HIGH}"
      user_input = gets.chomp.to_i
    end
    user_input
  end

  def correct_guess
    guess == secret_number
  end

  def print_high_or_low
    if guess > secret_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end

  attr_accessor :secret_number, :remaining_guesses, :guess
end

# examples
game = GuessingGame.new
game.play

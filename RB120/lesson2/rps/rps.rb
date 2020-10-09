# Game classes
class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def to_s
    @value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @move = nil
    @score = 0
    set_name
  end

  def human?
    @player_type == :human
  end

  def did_win?
    score >= 10
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Orchestration Engine
class RPSGame
  GAME_SCORE_CAP = 10

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper Scissors! First to #{GAME_SCORE_CAP} wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors.  Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def human_won_round?
    human.move > computer.move
  end

  def computer_won_round?
    human.move < computer.move
  end

  def human_won_game?
    human.score >= GAME_SCORE_CAP
  end

  def computer_won_game?
    computer.score >= GAME_SCORE_CAP
  end

  def increment_score
    if human_won_round?
      human.score += 1
    elsif computer_won_round?
      computer.score += 1
    end
  end

  def display_round_winner
    if human_won_round?
      puts "#{human.name} won!"
    elsif computer_won_round?
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_scores(string = "Current")
    puts "-----------------------------------"
    puts "#{string} Scores:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts "-----------------------------------"
  end

  def game_winner?
    human_won_game? || computer_won_game?
  end

  def display_game_winner
    if human_won_game?
      puts "#{human.name} won the game!"
    elsif computer_won_game?
      puts "#{computer.name} won the game!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
    end
    return true if answer == 'y'
    return false if answer == 'n'
  end

  def game_start
    display_welcome_message
    human.score = 0
    computer.score = 0
  end

  def choose_moves
    human.choose
    computer.choose
    display_moves
  end

  def display_round_results
    increment_score
    display_round_winner
    display_scores
  end

  def display_game_results
    display_game_winner
    display_scores("Final")
  end

  def play
    loop do
      game_start
      loop do
        choose_moves
        display_round_results
        break if game_winner?
      end
      display_game_results
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

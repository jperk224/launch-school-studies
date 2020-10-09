# Game classes
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_reader :value

  def initialize(value)
    @value = set_move_object(value)
  end

  def set_move_object(value)
    case value
    when 'rock'
      Rock.new
    when 'paper'
      Paper.new
    when 'scissors'
      Scissors.new
    when 'lizard'
      Lizard.new
    when 'spock'
      Spock.new
    end
  end

  def to_s
    value.to_s
  end

  def >(other_move)
    value.defeats.include?(other_move.to_s)
  end

  def <(other_move)
    value.loses_to.include?(other_move.to_s)
  end
end

class Rock
  def to_s
    'rock'
  end
  
  attr_reader :defeats, :loses_to

  def initialize
    @defeats = ['scissors', 'lizard']
    @loses_to = ['paper', 'spock']
  end
end

class Paper
  def to_s
    'paper'
  end

  attr_reader :defeats, :loses_to

  def initialize
    @defeats = ['spock', 'rock']
    @loses_to = ['scissors', 'lizard']
  end
end

class Scissors
  def to_s
    'scissors'
  end

  attr_reader :defeats, :loses_to

  def initialize
    @defeats = ['paper', 'lizard']
    @loses_to = ['rock', 'spock']
  end
end

class Lizard
  def to_s
    'lizard'
  end

  attr_reader :defeats, :loses_to

  def initialize
    @defeats = ['spock', 'paper']
    @loses_to = ['scissors', 'rock']
  end
end

class Spock
  def to_s
    'spock'
  end
  
  attr_reader :defeats, :loses_to

  def initialize
    @defeats = ['scissors', 'rock']
    @loses_to = ['lizard', 'paper']
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    @move = nil
    @score = 0
    set_name
    @move_history = []
  end

  def human?
    @player_type == :human
  end

  def did_win?
    score >= 10
  end

  def add_move_to_history(move)
    move_history << move
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
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    self.add_move_to_history(move)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def make_choice
    case self.name
    when 'R2D2'
      'rock'
    when 'Hal'
      (('rock ' * 10).split + ['paper', 'spock']).sample
    when 'Chappie'
      (('lizard ' * 10).split + ['paper', 'spock']).sample
    when 'Sonny'
      (('scissors ' * 10).split + ['paper', 'spock']).sample
    when 'Number 5'
      'spock'
    end
  end

  def choose
    self.move = Move.new(self.make_choice)
    # self.move = Move.new(Move::VALUES.sample)
    self.add_move_to_history(move)
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, or Spock! First to #{GAME_SCORE_CAP} wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing.  Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}"
    puts "#{computer.name} chose #{computer.move.value}"
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
    human.move_history = []
    computer.move_history = []
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

  def display_move_history(player)
    puts "Move History for #{player.name}:"
    puts player.move_history.join(', ')
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
        display_move_history(human)
        display_move_history(computer)
        break if game_winner?
      end
      display_game_results
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play

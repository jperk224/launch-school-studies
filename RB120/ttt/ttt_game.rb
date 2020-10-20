require 'pry'

module Helpable # TTT helper functions
  def joinor(array, delimter, word)
    if array.length > 1
      "#{array[0, array.length - 1].join(delimter)}#{delimter}#{word} #{array.last}"
    else
      array.first.to_s
    end
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

# game board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                  [[1, 5, 9], [3, 5, 7]]                # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select do |key|
      @squares[key].unmarked?
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  # return winning marker or nil
  def detect_winner
    # line is a 3-element array that represents a winning line
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  # get blocking move
  def blocking_move(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if opponent_almost_won?(squares, marker)
        return blocking_square_number(line)
      end
    end
    nil
  end

  def reset
    (1..9).each do |key|
      @squares[key] = Square.new
    end
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2
    markers.min == markers.max
  end

  def one_empty_marker?(squares)
    markers = squares.select(&:unmarked?).collect(&:marker)
    return false if markers.size != 1
    markers.first == Square::INITIAL_MARKER
  end

  def line_almost_won?(squares)
    two_identical_markers?(squares) && one_empty_marker?(squares)
  end

  def opponent_almost_won?(squares, marker)
    markers = squares.collect(&:marker)
    line_almost_won?(squares) && markers.max == marker
  end

  def blocking_square_number(square_numbers)
    square_numbers.each do |num|
      return num if @squares[num].marker == Square::INITIAL_MARKER
    end
  end
end

# an individual square on the board
class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def marked?
    @marker != INITIAL_MARKER
  end
end

# game engine
class TicTacToeEngine
  include Helpable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  GAME_CAP_SCORE = 5

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer
  attr_accessor :current_marker

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play_round
    loop do
      display_board
      play_set
      increment_score
      display_result
      break if grand_winner?
      reset_round
    end
  end

  def main_game
    loop do
      play_round
      display_grand_winner
      break unless play_again?
      reset_game
      display_play_again_message
    end
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing.  Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}.  Computer is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys, ', ', 'or')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid choice"
    end
    board[square] = human.marker
  end

  def computer_moves
    blocking_move = board.blocking_move(HUMAN_MARKER)
    if blocking_move
      board[blocking_move] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = COMPUTER_MARKER
    else
      computer_moves
      self.current_marker = HUMAN_MARKER
    end
  end

  def display_scores
    puts ""
    puts "Scores:"
    puts "Human: #{human.score}"
    puts "Computer: #{computer.score}"
    puts ""
  end

  def increment_score
    case board.detect_winner
    when HUMAN_MARKER
      human.score += 1
    when COMPUTER_MARKER
      computer.score += 1
    end
  end

  def display_set_winner
    case board.detect_winner
    when HUMAN_MARKER
      puts "You Won!"
    when COMPUTER_MARKER
      puts "Computer Won!"
    else
      puts "The board is full, It's a tie!"
    end
  end

  def display_result
    clear_screen_and_display_board
    display_set_winner
    display_scores
    puts "Press 'enter' key to continue..."
    gets.chomp
  end

  def grand_winner?
    human.score >= GAME_CAP_SCORE || computer.score >= GAME_CAP_SCORE
  end

  def display_grand_winner
    if human.score > computer.score
      puts "You are the grand winner!"
    else
      puts "Computer is the grand winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_round
    board.reset
    self.current_marker = FIRST_TO_MOVE
    clear
  end

  def reset_game
    reset_round
    human.score = 0
    computer.score = 0
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def game_over?
    board.someone_won? || board.full?
  end

  def human_turn?
    current_marker == HUMAN_MARKER
  end

  def play_set
    loop do
      current_player_moves
      break if game_over?
      clear_screen_and_display_board if human_turn?
    end
  end
end

# play the game
game = TicTacToeEngine.new
game.play

class Player
  def initialize
    # name
    # score
    # mark character
  end

  # make mark on the game board?
  def mark

  end
end

# game board
class Board
  def initialize
    # size
  end
end

# an individual square on the board
class Square
  def initialize
    # is_filled?
    # mark
    # number on grid
  end
end

class Move
  def initialize
    # grid number choice
    # mark character
  end
end

class Rules
  def initialize

  end
end

# game engine
class TicTacToeEngine
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if winner? || board_full?
      display_board
      second_player_moves
      break if winner? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

# play the game
game = TicTacToeEngine.new
game.play

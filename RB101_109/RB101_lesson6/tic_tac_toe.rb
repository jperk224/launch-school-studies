require 'pry'

# Game constants
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
VALID_PLAYERS = ['Choose', 'Player', 'Computer']
FIRST_PLAYER = 'Choose' # Valid options are 'Choose', 'Player' 'Computer'

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
# Display the board
def display_board(board)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

# Initialize the board
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', joiner_word='or')
  last_element = arr[-1]
  sliced_arr = arr.slice(0, arr.length - 1)
  array_string = sliced_arr.join(delimiter)
  array_string << delimiter[0] if sliced_arr.length > 1
  if array_string.length >= 1
    "#{array_string} #{joiner_word} #{last_element}"
  else
    last_element.to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def check_for_move(brd, marker)
  square = 0
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = line[brd.values_at(*line).index(INITIAL_MARKER)]
      break
    end
  end
  square
end

def strategic_move(brd)
  square = check_for_move(brd, COMPUTER_MARKER) # check for win first
  square = check_for_move(brd, PLAYER_MARKER) if square == 0
  square = 5 if empty_squares(brd).include?(5)
  square
end

def computer_places_piece!(brd)
  square = strategic_move(brd)
  square = empty_squares(brd).sample if square == 0
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # force the method's return into a boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def advance_game
  loop do
    prompt "Press Return key to continue."
    entry = gets.chomp
    break if entry == ""
  end
end

def prompt_for_player
  options = VALID_PLAYERS.select { |option| option != 'Choose' }
  choice = ''
  loop do
    prompt "Please choose who will go first (#{options.join(', ')})"
    choice = gets.chomp.capitalize
    break if VALID_PLAYERS.include?(choice)
    prompt "That is not a valid choice."
  end
  choice
end

def choose_first_player
  if FIRST_PLAYER == 'Choose'
    prompt_for_player
  else
    FIRST_PLAYER
  end
end

# main game
loop do
  player_score = 0
  computer_score = 0
  first_move = choose_first_player
  loop do
    board = initialize_board
    loop do
      if first_move == 'Player'
        display_board(board)
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        display_board(board)
      else
        computer_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
        display_board(board)
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
      end
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end

    prompt "Player Score: #{player_score} | Computer Score: #{computer_score}"
    advance_game

    if player_score >= 5
      prompt "Player is grand champion!"
      break
    elsif computer_score >= 5
      prompt "Computer is grand champion!"
      break
    end
  end

  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"

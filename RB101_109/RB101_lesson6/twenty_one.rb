=begin
Rules:
- Dealer vs. Player: Get as close to 21 as possible without going over
- Start with a normal 52-card deck (4 suits, 13 values each)
- Each is initally dealt 2 cards
  - Player can see both cards, only one of the dealer
- Card Values
  - 2 - 10 Face
  - J Q K - 10
  - A 1 or 11
- Player goes first
  - Hit = take another card
  - Stay = Dealer turn
- The dealer must continue to hit until the total is at least 17
- If no bust, compare hands to see who has the highest value
=end

require 'pry'
require 'yaml'

# Game Constants
MESSAGES = YAML.load_file('twenty_one_messages.yml')
VALID_MOVES = %w(h s hit stay)

# Game Methods
def prompt(string)
  puts "=> #{string}"
end

def initialize_deck
  suits = %w(Clubs Diamonds Hearts Spades)
  cards = (2..10).to_a + %w(Jack Queen King Ace)
  deck = []
  suits.each do |suit|
    cards.each do |card|
      deck << [suit, card]
    end
  end
  deck
end

def deal_card!(deck)
  deck.delete(deck.sample)
end

def show_cards(card_array, delimeter=', ', join_word='and')
  last_element = card_array[-1]
  if card_array.length == 0
    ""
  elsif card_array.length == 1
    last_element.to_s
  else
    sliced_card_array = card_array.slice(0, card_array.length - 1)
    "#{sliced_card_array.join(delimeter)} #{join_word} #{last_element}"
  end
end

def get_card_faces(hand)
  hand.map { |card| card[1] }
end

def calculate_hand_value(hand)
  ace_count = get_card_faces(hand).count('A')
  sum = 0
  get_card_faces(hand).each do |card|
    if (2..10).cover?(card)
      sum += card
    elsif %w(Jack Queen King).include?(card)
      sum += 10
    elsif ace_count > 1
      sum += 1
      ace_count -= 1
    else
      sum += 11
    end
  end
  sum -= 10 if sum > 21 && ace_count == 1 # adjust down last ace if needed
  sum
end

def display_dealer_hand(hand)
  card_values = get_card_faces(hand)
  card_values[-1] = "Unknown Card"
  puts "#{MESSAGES['dealer_shows']} #{show_cards(card_values)}"
end

def display_player_hand(hand)
  card_values = get_card_faces(hand)
  puts "#{MESSAGES['player_shows']} #{show_cards(card_values)}"
end

def display_hands(player_hand, dealer_hand)
  display_dealer_hand(dealer_hand)
  display_player_hand(player_hand)
end

def show_full_hand(hand)
  card_values = get_card_faces(hand)
  show_cards(card_values)
end

def player_move
  choice = ''
  loop do
    prompt(MESSAGES["player_choice"])
    choice = gets.chomp.downcase
    break if VALID_MOVES.include?(choice)
    prompt(MESSAGES["invalid_selection"])
  end
  choice
end

def bust?(sum)
  sum > 21
end

def calculate_winner(player_sum, dealer_sum)
  if  ((player_sum > dealer_sum) || bust?(dealer_sum)) &&
      !bust?(player_sum)
    "Player"
  elsif ((dealer_sum > player_sum) || bust?(player_sum)) &&
        !bust?(dealer_sum)
    "Dealer"
  else
    "Tie"
  end
end

def display_winner(player_sum, dealer_sum)
  puts "*****************************"
  prompt "Player Total: #{player_sum}"
  prompt "Dealer Total: #{dealer_sum}"
  if calculate_winner(player_sum, dealer_sum) == "Player"
    prompt(MESSAGES["player_win"])
  elsif calculate_winner(player_sum, dealer_sum) == "Dealer"
    prompt(MESSAGES["dealer_win"])
  else
    prompt(MESSAGES["tie"])
  end
  puts "*****************************"
end

def advance_game
  loop do
    prompt "Press Return key to continue."
    entry = gets.chomp
    break if entry == ""
  end
end

def display_game_summary(player_hand, dealer_hand, player_sum, dealer_sum, player_win_count, dealer_win_count)
  prompt "Player: #{show_full_hand(player_hand)}"
  prompt "Dealer: #{show_full_hand(dealer_hand)}"
  display_winner(player_sum, dealer_sum)
  prompt "Player Round Wins: #{player_win_count}"
  prompt "Dealer Round Wins: #{dealer_win_count}"
  puts "*****************************"
  advance_game
end

# Main game
loop do
  prompt(MESSAGES["welcome"])
  player_win_count = 0
  dealer_win_count = 0
  advance_game
  loop do
    loop do
      system'clear'
      deck = initialize_deck
      player_hand = []
      dealer_hand = []

      # Initial Deal
      2.times { player_hand << deal_card!(deck) }
      2.times { dealer_hand << deal_card!(deck) }
      player_sum = calculate_hand_value(player_hand)
      dealer_sum = calculate_hand_value(dealer_hand)

      # Enter player loop
      while player_sum < 21
        display_hands(player_hand, dealer_hand)
        next_move = player_move
        break if next_move == 's' || next_move == 'stay'
        player_hand << deal_card!(deck)
        player_sum = calculate_hand_value(player_hand)
      end

      # Bust if player > 21
      if bust?(player_sum)
        puts(MESSAGES["player_busted"])
        dealer_win_count += 1
        display_game_summary(player_hand, dealer_hand, player_sum, dealer_sum, player_win_count, dealer_win_count)
        break
      end

      # Dealer loop
      while dealer_sum < 17
        display_hands(player_hand, dealer_hand)
        puts(MESSAGES["dealer_hit"])
        dealer_hand << deal_card!(deck)
        dealer_sum = calculate_hand_value(dealer_hand)
      end

      # Bust if dealer > 21
      if bust?(dealer_sum)
        puts(MESSAGES["dealer_busted"])
        player_win_count += 1
        display_game_summary(player_hand, dealer_hand, player_sum, dealer_sum, player_win_count, dealer_win_count)
        break
      end

      player_win_count += 1 if calculate_winner(player_sum, dealer_sum) == 'Player'
      dealer_win_count += 1 if calculate_winner(player_sum, dealer_sum) == 'Dealer'

      display_game_summary(player_hand, dealer_hand, player_sum, dealer_sum, player_win_count, dealer_win_count)
      break
    end
    break if player_win_count >= 5 || dealer_win_count >= 5
  end
  
  if player_win_count > dealer_win_count
    prompt(MESSAGES["player_champ"])
  else
    prompt(MESSAGES["dealer_champ"])
  end

  prompt(MESSAGES["play_again"])
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

prompt(MESSAGES["goodbye"])

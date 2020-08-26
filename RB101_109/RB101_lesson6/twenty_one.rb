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

# Main game
deck = initialize_deck
player_hand = []
dealer_hand = []

prompt(MESSAGES["welcome"])

# Initial Deal
2.times { player_hand << deal_card!(deck) }
2.times { dealer_hand << deal_card!(deck) }
p player_hand
p dealer_hand
display_hands(player_hand, dealer_hand)

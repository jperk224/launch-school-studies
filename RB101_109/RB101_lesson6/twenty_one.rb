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

# Game Constants


# Game Methods
def initialize_deck
  suits = %w(C D H S)
  cards = (2..10).to_a + %w(J Q K A)
  deck = []
  suits.each do |suit|
    cards.each do |card|
      deck << [suit, card]
    end
  end
  deck
end

def deal_card!(deck)
  card = deck.delete(deck.sample)  
end

# Main game
deck = initialize_deck
player_hand = []
dealer_hand = []

# Initial Deal
2.times { player_hand << deal_card!(deck) }
2.times { dealer_hand << deal_card!(deck) }

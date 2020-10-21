require 'pry'

# parent class for human player and computer dealer
class Participant
  BUST_THRESHOLD = 21

  attr_reader :name

  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
    @name = name_initialization
  end

  def hit
  end

  def stay
  end

  def busted?
    total > BUST_THRESHOLD
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end

  def show_hand

  end

  def name_initialization; end
end

class Player < Participant

  private

  def name_initialization
    name = nil
    loop do
      puts "Please enter your name."
      name = gets.chomp
      break unless name.empty?
      puts "Please enter at least one letter or number."
    end
    name
  end
end

class Dealer < Participant

  private

  def name_initialization
    ['Bobby Flay', 'Toby Mac', 'Orlando Hudson', 'Mr. McGregor'].sample
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def deal
    card = cards.sample
    index = cards.find_index(card)
    cards.delete_at(index)
  end

  private

  def create_deck
    cards = []
    suits = %w(Hearts Diamonds Clubs Spades)
    faces = (2..10).to_a + %w(Jack Queen King Ace)
    suits_with_faces = suits.product(faces)
    suits_with_faces.each do |card|
      cards << Card.new(card[0], card[1])
    end
    cards
  end

  # do we need this?
  def not_empty?
    !cards.empty?
  end
end

class Card
  VALUES =  (((2..10).to_a + %w(Jack Queen King Ace))\
            .zip((2..10).to_a + [10, 10, 10, 11])).to_h
  
  attr_reader :suit, :face, :value

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = VALUES[@face]
  end

  def to_s
    "#{face} of #{suit}"
  end
end

class Game
  def start
    deck = Deck.new
    player = Player.new
    dealer = Dealer.new
    puts player.name
    puts dealer.name
    # what's the sequence of steps to execute the game play?
    # deal_cards
    # show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end
end

Game.new.start

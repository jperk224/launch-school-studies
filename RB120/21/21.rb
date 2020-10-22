require 'pry'

# parent class for human player and computer dealer
class Participant
  BUST_THRESHOLD = 21

  attr_reader :name, :hand

  def initialize
    @name = name_initialization
    @hand = []
  end

  def busted?
    total > BUST_THRESHOLD
  end

  def total
    hand.map { |card| card.value }.reduce(:+)
  end

  def show_hand
    puts""
    puts "#{name} has:"
    print_hand
    puts ""
  end

  def add_card(card)
    hand << card
  end

  private

  # stub to signify child overriding
  def name_initialization; end
  def print_hand; end
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

  def print_hand
    hand.each do |card|
      puts card
    end
  end
end

class Dealer < Participant

  private

  def name_initialization
    ['Bobby Flay', 'Toby Mac', 'Orlando Hudson', 'Mr. McGregor'].sample
  end

  def print_hand
    print_range = hand.length - 2
    (0..print_range).each do |index|
      puts hand[index]
    end
    puts "One unknown card"
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
  INITIAL_HAND_SIZE = 2
  MOVE_CHOICES = %w(h s hit stay)
  DEALER_THRESHOLD = 17

  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    display_welcome_message
    loop do
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn
      # show_result
      break unless play_again
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts  "\nWelcome to 21 #{player.name}! "\
          "You are playing against #{dealer.name}."
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def play_again
    choice = nil
    valid_yes = %w(y yes)
    valid_no = %w(n no)
    loop do
      puts "\nWould you like to play again ([Y]es/[N]o)?"
      choice = gets.chomp.downcase
      break if valid_yes.include?(choice) || valid_no.include?(choice)
      puts "That is not a valid choice"
    end
    return true if valid_yes.include?(choice)
    return false if valid_no.include?(choice)
  end

  def deal_cards
    (1..INITIAL_HAND_SIZE).each do
      player.add_card(deck.deal)
      dealer.add_card(deck.deal)
    end
  end

  def show_initial_cards
    show_hands
  end

  def show_hands
    player.show_hand
    dealer.show_hand
  end

  def advance_turn

  end

  def prompt_player
    player_choice = nil
    loop do
      puts "Would you like to [H]it or [S]tay?"
      player_choice = gets.chomp
      break if MOVE_CHOICES.include?(player_choice.downcase)
      puts "That is not a valid choice.  Please try again."
      puts ""
    end
    player_choice
  end

  def prompt_to_continue
    puts "Press 'return' key to continue."
    gets.chomp
  end

  def player_busted
    if player.busted?
      puts "#{player.name} busts!"
      puts ""
      true
    else
      false
    end
  end

  def dealer_busted
    if dealer.busted?
      puts "#{dealer.name} busts!"
      puts ""
      true
    else
      false
    end
  end

  def player_turn
    loop do
      choice = prompt_player
      hit = ['h', 'hit'].include?(choice.downcase) ? true : false
      break unless hit
      player.add_card(deck.deal)
      show_hands
      break if player_busted
    end
  end

  def dealer_turn
    loop do
      break if dealer.total >= DEALER_THRESHOLD
      puts "\n#{dealer.name} takes a card."
      dealer.add_card(deck.deal)
      show_hands
      prompt_to_continue
      return if dealer_busted
    end
    puts "\n#{dealer.name} stays."
  end
end

Game.new.start

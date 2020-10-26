# parent class for human player and computer dealer
class Participant
  MAX_HAND_VALUE = 21

  attr_reader :name, :hand

  def initialize
    @name = name_initialization
    self.hand = []
  end

  def busted?
    total > MAX_HAND_VALUE
  end

  def calcuate_for_aces(hand_values, total)
    ace_count = hand_values.count(11)
    if ace_count > 0
      while total > 21 && ace_count > 0
        total -= 10
        ace_count -= 1
      end
    end
    total
  end

  def total
    hand_values = hand.map(&:value)
    total = hand_values.reduce(:+)
    calcuate_for_aces(hand_values, total)
  end

  def show_hand
    puts ""
    puts "#{name} has:"
    print_hand
    puts ""
  end

  def add_card(card)
    hand << card
  end

  def empty_hand
    self.hand = []
  end

  private

  attr_writer :hand

  protected

  def print_hand
    hand.each do |card|
      puts card
    end
  end
end

class Player < Participant
  private

  def name_initialization
    name = nil
    loop do
      puts "Please enter your name."
      name = gets.chomp
      break unless name.empty? || !name.match?(/[A-Za-z0-9]/)
      puts "Please enter at least one letter or number."
    end
    name
  end
end

class Dealer < Participant
  def print_full_hand
    Participant.instance_method(:print_hand).bind(self).call
  end

  def show_full_hand
    puts ""
    puts "#{name} has:"
    print_full_hand
    puts ""
  end

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
    self.cards = create_deck
  end

  def deal
    card = cards.sample
    index = cards.find_index(card)
    cards.delete_at(index)
  end

  def reset
    self.cards = []
    self.cards = create_deck
  end

  private

  attr_writer :cards

  def create_deck
    cards = []
    suits_with_faces = Card::SUITS.product(Card::FACES)
    suits_with_faces.each do |card|
      cards << Card.new(card[0], card[1])
    end
    cards
  end
end

class Card
  SUITS = %w(Hearts Diamonds Clubs Spades)
  FACES = (2..10).to_a + %w(Jack Queen King Ace)
  VALUES = (FACES.zip((2..10).to_a + [10, 10, 10, 11])).to_h

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
    system 'clear'
    display_welcome_message
    loop do
      play_hand
      show_result
      break unless play_again
      reset
    end
    display_goodbye_message
  end

  private

  def play_hand
    loop do
      deal_cards
      show_initial_cards
      player_turn
      break if player.busted?
      dealer_turn
      break if dealer.busted?
      break
    end
  end

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
    valid_yes.include?(choice)
  end

  def reset
    system 'clear'
    deck.reset
    player.empty_hand
    dealer.empty_hand
  end

  def show_result
    if player.busted?
      puts "#{player.name} busts! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} busts! #{player.name} wins!"
    else
      display_winner
    end
  end

  def display_totals
    system 'clear'
    puts "\nFinal Hands:"
    show_full_hands
    # puts "\nTotals:"
    # puts "#{player.name}: #{player.total}"
    # puts "#{dealer.name}: #{dealer.total}"
  end

  def display_winner
    display_totals
    if player.total > dealer.total
      puts "\n#{player.name} wins!"
    elsif dealer.total > player.total
      puts "\n#{dealer.name} wins!"
    else
      puts "\nPush! No winner."
    end
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

  def display_player_total
    puts "#{player.name} has: #{player.total}"
  end

  def display_dealer_total
    puts "#{dealer.name} has: #{dealer.total}"
  end

  def show_hands
    player.show_hand
    display_player_total
    dealer.show_hand
  end

  def show_full_hands
    player.show_hand
    display_player_total
    dealer.show_full_hand
    display_dealer_total
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
    puts "\nPress 'return' key to continue."
    gets.chomp
  end

  def player_turn
    loop do
      choice = prompt_player
      system 'clear'
      hit = ['h', 'hit'].include?(choice.downcase)
      break unless hit
      player.add_card(deck.deal)
      show_hands
      break if player.busted?
    end
  end

  def dealer_hits
    loop do
      system 'clear'
      break if dealer.total >= DEALER_THRESHOLD
      puts "\n#{dealer.name} takes a card."
      dealer.add_card(deck.deal)
      show_full_hands
      prompt_to_continue
      return if dealer.busted?
    end
  end

  def dealer_turn
    show_full_hands
    dealer_hits
    puts "\n#{dealer.name} stays." if !dealer.busted?
  end
end

Game.new.start

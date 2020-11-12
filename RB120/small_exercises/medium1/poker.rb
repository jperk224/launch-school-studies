class Card
  include Comparable

  CARD_RANK = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    CARD_RANK[rank] <=> CARD_RANK[other_card.rank]
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# create a deck class that contains all standard 52 playing cards
# provide a draw method to deal one card
# deck should be shuffled at initialization
# if it runs out of cards, reste itself by generating a new set of 52 shuffled cards
class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    new_deck
  end

  # draw method
  # check whether deck's length is greater than 0
    # if so, pop a card out of the array and return it
    # else generate new deck and then pop a card out of the array to return
  
  def draw
    new_deck if deck.length <= 0
    deck.pop
  end

  # create a new deck
  # initialize an empty deck array
  # for every combination of RANKS and SUITS create a new Card and add it to the deck

  private

  attr_accessor :deck

  def new_deck
    self.deck = []
    RANKS.product(SUITS).each do |card|
      deck << Card.new(card[0], card[1])
    end
    deck.shuffle!
  end
end

# create a class, PokerHand, that takes 5 cards from a deck of cards
# and evaluates those cards as a poker hand
# skelton class provided
class PokerHand
  def initialize(deck)
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end

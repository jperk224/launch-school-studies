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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.

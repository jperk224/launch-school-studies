# the game is 21
- take a normal deck of 52 cards consisting of 4 suits (hearts, diamonds, clubs, spades)
- 13 values per suit (2..10, J, K, Q, A)

# rules
- Get as close to 21 as possible without going over
- 2 players --> dealer (computer) and player (human)
- Both pllayers are initally dealt 2 cards
  - player can see both cards
  - only one dealer card is visible
- Card values
  - 2 through 10 --> facce value
  - J, Q, K --> 10 
  - A --> 1 or 11
    - starts at 11, drops to 1 if sum of hand > 21
- Player goes first, decides to hit of stay (actions)
- Player goes first, game is immediatley over if player busts
- Dealer has to hit until at least 17
- Compare hand values to see who wins

# nouns
- card, game, dealer, player, participant, deck, total, score, turn
# verbs
- deal, hit, stay, bust, compare [totals]

# organize
Player
- hit
- stay
- bust
- total

Dealer
- hit
- stay
- bust
- total
- deal (should probably be under deck to limit dependencies)

Participant

Deck
- deal

Card

Game
- start

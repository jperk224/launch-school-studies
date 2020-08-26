require 'pry'

def get_card_faces(hand)
  hand.map { |card| card[1] }
end

def calculate_hand_value(hand)
  ace_count = get_card_faces(hand).count('A')
  sum = 0
  get_card_faces(hand).each do |card|
    if (2..10).cover?(card)
      sum += card
    elsif %w(J Q K).include?(card)
      sum += 10
    elsif ace_count > 1
      sum += 1
      ace_count -= 1
    else
      sum += 11
    end
  end
  sum
end

p calculate_hand_value([["Clubs", 7], ["Diamonds", "K"], ["Diamonds", "J"], ["Clubs", 5]]) == 32
p calculate_hand_value([["Clubs", "A"], ["Diamonds", "A"], ["Diamonds", "J"], ["Clubs", 5]]) == 27
p calculate_hand_value([["Clubs", "A"], ["Diamonds", "A"], ["Diamonds", "A"], ["Clubs", "A"]]) == 14
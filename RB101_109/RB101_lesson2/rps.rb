# Rock, Paper, Scissors
# User makes a choice
# Computer makes a choice
# Winner is displayed

# program variables
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_ENTRIES = %w(r p s l)

def prompt(message)
  puts "=> #{message}"
end

def map_s()
  choice = ''

  loop do
    prompt("Please be more specific: 1) spock 2) scissors")
    choice = gets.chomp.downcase
    break if ['1','2'].include?(choice) || ['spock', 'scissors'].include?(choice)
    prompt("That is not a valid entry.")    
  end

  if choice == '1' || choice == 'spock'
    'spock'
  else
    'scissors'
  end
end

# def increment_score(score)
#   score_num = score.to_i
#   score_num += 1
#   score_num.to_s
# end

def max_score_reached(score)
  score >= 5
end

# def increase_player_score(first, second, first_score, second_score)
#   if win?(first, second)
#     increment_score(first_score)
#   elsif win?(second, first)
#     increment_score(second_score)
#   end
# end

def display_score(first='You', second='Computer', first_score, second_score)
  prompt("#{first}: #{first_score}; #{second}: #{second_score}")
end

def display_winner(first='You', second='Computer', first_score, second_score)
  if first_score > second_score
    prompt("#{first} is GRAND WINNER!")
  elsif second_score > first_score
    prompt("#{second} is GRAND WINNER!")
  else
    prompt("It's a GRAND Tie!!")
  end
end

def map_player_entry_to_valid_choice(char)
  case char.downcase
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'l' then 'lizard'
  when 's' then map_s()
  end
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You Lost!")
  else
    prompt("It's a tie!")
  end
end

# initialize game variables
player_score = 0
computer_score = 0
choice = ''

loop do
  # ask the user to make a choice
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp().downcase
    if VALID_ENTRIES.include?(choice)
      choice = map_player_entry_to_valid_choice(choice)
      break
    elsif VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  # generate the random computer choice
  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_results(choice, computer_choice)
  
  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  display_score(player_score, computer_score)

  if player_score >= 5 || computer_score >= 5
    display_winner(player_score, computer_score)
    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for playing.  Good bye!")
require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  Daniel Lounsbury					 	#
#  lounsbud@oregonstate.edu                	#
#										#
#########################################



# your code here
$player1_list = [StupidBot.new('StupidBot',History.new), 
  RandomBot.new('RandomBot',History.new), 
  IterativeBot.new('IterativeBot',History.new), 
  LastPlayBot.new('LastPlayBot',History.new), 
  HumanPlayer.new('Human',History.new)]
$player2_list = [StupidBot.new('StupidBot',History.new), 
  RandomBot.new('RandomBot',History.new), 
  IterativeBot.new('IterativeBot',History.new), 
  LastPlayBot.new('LastPlayBot',History.new), 
  HumanPlayer.new('Human',History.new)]

def intro()
  puts("Welcome to Rock, Paper, Scissors, Lizard, Spock!\n\n")
  setup()
end 

def setup()
  valid_choices = false
  while valid_choices == false
    puts("Please choose two players:")
    puts("(1) StupidBot\n(2) RandomBot\n(3) IterativeBot\n(4) LastPlayBot\n(5) Human")
    print "Select player 1:"
  $stdout.flush
  player1_selector = gets.strip.chomp
  print "Select player 2:"
  $stdout.flush
  player2_selector = gets.strip.chomp
    if (1..5).include?(player1_selector.to_i) && (1..5).include?(player2_selector.to_i)
      $player1 = $player1_list[player1_selector.to_i-1]
      $player2 = $player2_list[player2_selector.to_i-1]
      valid_choices=true
      puts("#{$player1.name} vs. #{$player2.name}\n\n")
    else
      puts "Invalid choice(s) - start over\n"
    end
  end
end

def debug()
  puts("DEBUG:p1: #{$player1.name}, p2: #{$player2.name}:END DEBUG\n")
end

def round(round_number)
  puts("Round #{round_number}:")
  p1_move = $player1.play()
  p1_move_name = p1_move.name
  p2_move = $player2.play()
  p2_move_name = p2_move.name
  puts("Player 1 chose #{p1_move_name}\n")
  puts("Player 2 chose #{p2_move_name}\n")
  round_blurb, result= p1_move.compare_to(p2_move)
  $player2.history.log_opponent_play(p1_move)
  $player1.history.log_opponent_play(p2_move)
  puts round_blurb
  case result
    when "Tie"
      puts("Round was a tie")
    when "Win"
      puts("Player 1 won the round")
      $player1.history.add_score
    when "Lose"
      puts("Player 2 won the round")
      $player2.history.add_score
    else
    fail("round result output error")
  end

  puts "\n"
end

def final_score()
  puts "Final score is #{$player1.history.score} to #{$player2.history.score}"
  p1_score = $player1.history.score
  p2_score = $player2.history.score
  if p1_score > p2_score
    puts("Player 1 wins")
  elsif p2_score > p1_score
    puts("Player 2 wins")
  elsif p1_score == p2_score
    puts("Game was a draw")
  else
    fail "Scoring error"
  end
end

def game(n_rounds)
  intro()
  # debug()
  for x in 1..n_rounds do
  round(x)
  end
  final_score()
end

# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)
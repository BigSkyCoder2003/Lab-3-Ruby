require_relative "element.rb"
require_relative "history.rb"



class Player
  attr_reader :name, :history
  def initialize(name, history)
    @name = name
    @history = history
  end
  def play()
    fail "This method should be overridden"
  end
end

class StupidBot < Player
  def play()
    move = Rock.new('Rock')
    @history.log_play(move)
    move
  end
end

class RandomBot < Player
  def play()
    move = $moves[rand(5)]
    @history.log_play(move)
    move
  end
end

class IterativeBot < Player
  def initialize(name,history)
    super(name,history)
    @current_move_num = 0
  end
  def play()
    if  @current_move_num == ($moves.size)
      @current_move_num = 0
    end
    move = $moves[@current_move_num]
    @current_move_num +=1
    @history.log_play(move)
    move
  end
end

class LastPlayBot < Player
  def play()
    if @history.opponent_plays.empty?
      move = Rock.new('Rock')
      @history.log_play(move)
      return move
    end
    move = @history.opponent_plays[@history.opponent_plays.size-1]
    
    move
  end
end

class HumanPlayer < Player
  def play()
    validmove = false
    while validmove == false
      puts("(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock")
      print("Enter your move: ")
      $stdout.flush
      move = gets.strip.chomp

      if (1..5).include?(move.to_i)
        @history.log_play($moves[move.to_i-1])
        return $moves[move.to_i-1]
      end
      puts "Invalid move - try again\n"
    end 
      

  end
end

# p1 = StupidBot.new('StupidBot', History.new)
# p2 = RandomBot.new('RandomBot', History.new)
# p1move = p1.play()
# p2move = p2.play()
# puts p1move.compare_to(p2move)
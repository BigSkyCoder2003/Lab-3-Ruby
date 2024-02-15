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
    move = $moves[rand(4)]
    @history.log_play(move)
    move
  end
end

class InterativeBot < Player
  @current_move_num = 0
  def play()
    move = $moves[current_move_num]
    current_move_num+=1
    if current_move_num == ($moves.size-1)
      current_move_num = 0
    move
    end
  end
end

class LastPlayBot < Player
  def play()
    if log_opponent_play.empty?
      return Rock.new('Rock')
    end
    move = @history.log_opponent_play[log_opponent_play.size-1]
    @history.log_play(move)
    move
  end
end

class HumanPlayer < Player
  def play()
    validmove = false
    while validmove == false
      put("(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock")
      puts("Enter your move: ")
      move = gets

      if (1..5).include?(move)
        @history.log_play(move)
        return $move[(move.to_i)-1]
      end
      puts "\nInvalid move - try again"
    end 
      

  end
end

p1 = StupidBot.new('StupidBot', History.new)
p2 = RandomBot.new('RandomBot', History.new)
p1move = p1.play()
p2move = p2.play()
puts p1move.compare_to(p2move)
require_relative 'element.rb'
class History
  attr_accessor :play
  attr_accessor :opponent_plays
  attr_accessor :score

  def initialize
    @score = 0 
    opponent_plays = Array.new
    play = Array.new
  end

  log_play(move)
  play.push(move)
end

log_opponent_play(move)
opponent_plays.push(move)
end

add_score()
score+=1
end
end
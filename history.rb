class History
  attr_accessor :play
  attr_accessor :opponent_plays
  attr_accessor :score

  def initialize
    @score = 0 
    @opponent_plays = Array.new
    @play = Array.new
  end

  def log_play(move)
    @play.push(move)
  end

  def log_opponent_play(move)
    @opponent_plays.push(move)
  end

  def add_score()
    @score += 1
  end
end
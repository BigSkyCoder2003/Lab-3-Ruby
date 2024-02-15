require_relative:'element.rb'
class Rock < Element
  def compare_to(element)
    case element.name
      
    when self.name
      return "#{element.name} equals #{self.name}, Tie"
    when 'Lizard'
      return "#{self.name} crushes #{element.name}, Win"
    when 'Paper' 
      return "#{element.name} covers #{self.name}, Lose"
    when 'Spock'
      return "#{element.name} vaporizes #{self.name}, Lose"
    when 'Scissors'
      return "#{self.name} crushes #{element.name}, Win"
    else
      fail 'error comparing elements!'
  end
  end
end
# Scissors cut Paper
# Paper covers Rock
# Rock crushes Lizard
# Lizard poisons Spock
# Spock smashes Scissors
# Scissors decapitate Lizard
# Lizard eats Paper
# Paper disproves Spock
# Spock vaporizes Rock
# Rock crushes Scissors
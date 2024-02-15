require_relative:'element.rb'
class Lizard < Element
  def compare_to(element)
    case element.name

    when self.name
      return "#{element.name} equals #{self.name}, Tie"
    when 'Spock'
      return "#{self.name} poisons #{element.name}, Win"
    when 'Paper' 
      return "#{self.name} eats #{element.name}, Win"
    when 'Rock'
      return "#{element.name} crushes #{self.name}, Lose"
    when 'Scissors'
      return "#{element.name} decapitate #{self.name}, Lose"
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
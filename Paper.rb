require_relative:'element.rb'
class Paper < Element
  def compare_to(element)
    case element.name

    when self.name
      return "#{element.name} equals #{self.name}, Tie"
    when 'Lizard'
      return "#{element.name} eats #{self.name}, Lose"
    when 'Spock' 
      return "#{self.name} disproves #{element.name}, Win"
    when 'Rock'
      return "#{self.name} covers #{element.name}, Win"
    when 'Scissors'
      return "#{element.name} cut #{self.name}, Lose"
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
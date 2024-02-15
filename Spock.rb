require_relative:'element.rb'
class Spock < Element
  def compare_to(element)
    case element.name
      
    when self.name
      return "#{element.name} equals #{self.name}"
    
    when 'Lizard'
      return "#{element.name} poisons #{self.name}"

    when 'Paper' 
      return "#{element.name} disproves #{self.name}"

    when 'Rock'
      return "#{self.name} vaporizes #{element.name}"
    when 'Scissors'
      return "#{self.name} smashes #{element.name}"
    else
      fail 'error comparing elements!'
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
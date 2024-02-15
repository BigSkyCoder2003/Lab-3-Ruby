require_relative:'element.rb'
class Scissors < Element
  def compare_to(element)
    case element.name

    when self.name
      return "#{element.name} equals #{self.name}"
    
    when 'Lizard'
      return "#{self.name} decapitates #{element.name}"

    when 'Paper' 
      return "#{self.name} cut #{element.name}"

    when 'Rock'
      return "#{element.name} crushes #{self.name}"
    when 'Spock'
      return "#{element.name} smashes #{self.name}"
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
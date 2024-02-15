class Element
attr_accessor :name

  def initialize(name)
    @name = name
  end

  def compare_to(element)
  fail "This method should be overridden"
  end
end

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

class Scissors < Element
  def compare_to(element)
    case element.name

    when self.name
      return "#{element.name} equals #{self.name}, Tie"
    when 'Lizard'
      return "#{self.name} decapitate #{element.name}, Win"
    when 'Paper' 
      return "#{self.name} cut #{element.name}, Win"
    when 'Rock'
      return "#{element.name} crushes #{self.name}, Lose"
    when 'Spock'
      return "#{element.name} smashes #{self.name}, Lose"
    else
      fail 'error comparing elements!'
  end
  end
end

class Spock < Element
  def compare_to(element)
    case element.name

    when self.name
      return "#{element.name} equals #{self.name}, Tie"
    when 'Lizard'
      return "#{element.name} poisons #{self.name}, Lose"
    when 'Paper' 
      return "#{element.name} disproves #{self.name}, Lose"
    when 'Rock'
      return "#{self.name} vaporizes #{element.name}, Win"
    when 'Scissors'
      return "#{self.name} smashes #{element.name}, Win"
    else
      fail 'error comparing elements!'
  end
end
end






$moves = [Rock.new('Rock'), Paper.new('Paper'),Scissors.new('Scissors'),Lizard.new('Lizard'),Spock.new('Spock')]

rock  = Rock.new('Rock')
paper = Paper.new('Paper')
puts rock.compare_to(paper)
puts paper.compare_to(rock)
puts rock.compare_to(rock)
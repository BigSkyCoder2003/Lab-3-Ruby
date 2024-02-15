class Element
attr_accessor :name

  def initialize(name)
    
  end

  def compare_to
  fail "This method should be overridden"
  end
end
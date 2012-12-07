class Line
  attr_accessor :line
  
    
  def initialize
  @line = []
  end
        
  def add_Customer(Customer)
  @line.pop(Customer)
  end
  
  def remove_Customer
  @line.push(Customer)
  end
  
  
  
end
class Line
  
  attr_accessor :line
  
    
  def initialize
    @line = []
  end
        
  def add_customer(Customer)
    @line.pop(Customer)
  end
  
  def remove_customer
    @line.push(Customer)
  end
  

end
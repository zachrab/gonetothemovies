require './Customer.rb'

class Line
  
  attr_accessor :line
  
    
  def initialize
    @line = []
  end
        
  def add_customer(customer)
    @line.push(customer)
  end
  
  def remove_customer
    @line.pop(customer)
  end
  

end
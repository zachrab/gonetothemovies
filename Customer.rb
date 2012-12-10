class Customer
  attr_accessor :received_ticket, :time_in_line, :reached_window
  
  def initialize
    self.received_ticket = false
    self.reached_window = false
    self.time_in_line = 0
  end

  def still_waiting_in_line!
  self.time_in_line += 1
  end
  
  
end

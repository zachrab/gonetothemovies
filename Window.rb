class Window
  attr_accessor :service_time, :customer, :ticketsold, :clock, :current_window_time, 
                :line, :idle_time, :total_window_time
  
  def initialize(service_time, line, clock)
    self.service_time = service_time
    self.idle_time = 0
    self.ticketsold = 0
    self.clock = clock
    self.current_window_time = 0
    self.total_window_time = 0
    self.line = line
  end
  
  def next_customer!
    raise "There is already a customer at the window!" if self.occupied?
    next_customer = self.line.remove_customer
    if next_customer
      self.customer = next_customer
      self.customer.reached_window = true
    end
  end
  
  def process_tick!
    if self.occupied?
      self.current_window_time += 1
      self.total_window_time += 1
      if self.current_window_time >= service_time
        sell_ticket!
      end
    else
      self.next_customer!
    end
    self.idle_time += 1 unless self.occupied?  
  end
  
  def occupied?
    !self.customer.nil?
  end
  
  def print_summary
      puts "#{self.ticketsold} tickets sold"
      puts "#{self.idle_time} seconds idle"
    
  end
  
  private 
  
  def sell_ticket!
     self.customer.received_ticket = true
     self.customer = nil
     self.ticketsold += 1
     self.current_window_time = 0
     self.next_customer!
  end
  
end

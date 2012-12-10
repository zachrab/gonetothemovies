require './Customer.rb'

class Line
  
  attr_accessor :line, :total_wait_time, :max_wait_time, :clock, :max_length,
                :total_served
  
    
  def initialize(clock)
    self.line = []
    self.total_wait_time = 0
    self.max_wait_time = 0
    self.max_length = 0
    self.total_served = 0
    self.clock = clock
  end
  
  def length
    self.line.size
  end
  
  def add_customer
    self.line << Customer.new
    self.max_length = self.length if self.max_length < self.length
    line.last
  end
  
  def remove_customer
    customer = self.line.shift
    return unless customer
    self.total_served += 1
    self.total_wait_time += customer.time_in_line
    self.max_wait_time = customer.time_in_line if customer.time_in_line > self.max_wait_time
    customer
  end
  
  def notify_wait_time!
    self.line.each {|customer| customer.still_waiting_in_line!}
  end
  
  def print_summary
    puts "#{self.length} customers are waiting in line at end of simulation"
    puts "Maximum length was #{self.max_length}"
    puts "Avg. wait time: #{self.total_wait_time.to_f/self.total_served}"
    puts "Maximum wait time: #{max_wait_time}"
  end

end
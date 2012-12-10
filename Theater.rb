require './Line.rb'
require './Window.rb'

class Theater
  attr_accessor :lines, :windows, :total_tickets_sold, :average_wait_time, :total_served,
                :average_window_time

  def initialize(line_type, servicetimes, clock)
    self.lines = []
    self.windows = []
    self.total_tickets_sold = 0
    self.total_served = 0
    self.average_wait_time = 0
    self.average_window_time = 0
    self.lines.push(Line.new(clock)) if line_type == "S"
  
    servicetimes.size.times do |i|
      self.lines.push(Line.new(clock)) if line_type == "M"
      self.windows.push(Window.new(servicetimes[i].to_i, self.lines[-1], clock))
    end
  end
  
  def process_tick!
    self.windows.each {|window| window.process_tick!}
    self.lines.each {|line| line.notify_wait_time!}
  end
  
  def total_windows
    self.windows.size
  end
  
  def add_customers(number_of_customers)
    number_of_customers.times do |i|
      self.shortest_line.add_customer
    end
  end
   
  def shortest_line
    self.lines.sort_by {|line| line.length}.first
  end
  
  def calculate_total_tickets
    self.windows.each {|window| self.total_tickets_sold += window.ticketsold}
    self.total_tickets_sold
  end
  
  def calculate_average_wait_time
    total_wait_time = 0
    self.lines.each do |line|
      total_wait_time += line.total_wait_time.to_f
      self.total_served += line.total_served
    end 
    self.average_wait_time = total_wait_time/self.total_served
  end
  
  def calculate_average_window_time
    total_window_time = 0
    self.windows.each {|window| total_window_time += window.total_window_time}
    self.average_window_time = total_window_time.to_f/self.total_served
  end
  
  def print_summary
    puts "Printing Summary"
    self.windows.each{|window| window.print_summary}
    self.lines.each {|line| line.print_summary}
    puts "#{self.calculate_total_tickets} tickets sold"
    puts "Avg. wait time: #{self.calculate_average_wait_time}"
    puts "Avg. time spent at a window: #{self.calculate_average_window_time}"
  end
  
end
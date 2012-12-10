require './Theater.rb'
require './Clock.rb'
class Simulation
  def self.run
    @simvals = []
    @customer_arrival_times = {}
    @clock = Clock.new
    
    parse_input_file!
    build_theater!
    build_arrival_times!
        
    (@simvals[1].to_i*60).times do |simtime|
      @clock.tick
      current_arrivals = @customer_arrival_times[@clock.time]
      @theater.add_customers(current_arrivals) if current_arrivals
      @theater.process_tick!    
    end
    @theater.print_summary
    puts
  end
  
  def self.parse_input_file!
    #Parses input file
    File.open('simulation.txt', 'r') do |infile|
      while (line = infile.gets)
        @simvals << line
      end
    end
  end
  
  def self.build_windows!
    num_windows = @simvals[2].to_i
    service_times = []
    for i in 4..4 + num_windows - 1
      service_times << @simvals[i]
    end
    service_times
  end
  
  def self.build_theater!
    line_type = @simvals[3].split(" ").first
    @theater = Theater.new(line_type,build_windows!,@clock)
  end
  
  def self.build_arrival_times!
    @simvals[4+@theater.total_windows..-2].each do |val|
      k, v = val.split(" ")
      @customer_arrival_times[v.to_i] = k.to_i
    end
  end
  
end


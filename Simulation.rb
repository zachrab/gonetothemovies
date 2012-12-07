require './Theater.rb'
require './Clock.rb'
class Simulation
  def self.run
    @simvals = []
    num_windows = 0
    j = 0
    service_times = []
    all_cust = {}
    
    #Parses input file
    
    File.open('simulation.txt', 'r') do |infile|
      while (line = infile.gets)
        @simvals << line
      end
    end


    num_windows = @simvals[2].to_i
    for i in 4..4 + num_windows - 1
      service_times[j] = @simvals[i]
      j += 1
    end

    if @simvals[4] == "S"
      theater = Theater.new(1, service_times)
    else
      theater = Theater.new(service_times.size, service_times)
    end
   
    @simvals[4+num_windows..-2].each do |val|
      k, v = val.split(" ")
      all_cust[v.to_i] = k.to_i
    end


    #Simulation
    clock = Clock.new
  for simtime in 0..@simvals[1].to_i*60
    clock.tick
    all_custom.each_key do |key|
      if key == clock.time
        
  end
    
  end
end


class Simulation
attr_accessor :simvals
@simvals = {}
key = 0

File.open('simulation.txt', 'r') do |infile|
  while (line = infile.gets)
    @simvals.merge!(key => line)
    key = key + 1
  end
end



end

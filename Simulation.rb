class Simulation
  attr_accessor :simvals
  @simvals = {}
  num_windows = 0
  key = 0

File.open('simulation.txt', 'r') do |infile|
  while (line = infile.gets)
    @simvals.merge!(key => line)
    key = key + 1
  end
end

  num_windows = simvals[3] - 1
  for i in 5..5 + num_windows
if simvals[4] == "S"
  Theater.new(1,)

end

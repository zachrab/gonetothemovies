require './Line.rb'
require './Window.rb'

class Theater
  attr_accessor :lines, :windows

def initialize(numlines, servicetimes)
  @lines = []
  @windows = []
  for i in 0..numlines
    @lines.push(Line.new)
  end
  
  for i in 0..servicetimes.size
    @windows.push(Window.new(servicetimes[i]))
  end
  
end


end
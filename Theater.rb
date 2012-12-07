class Theater
  attr_accessor :lines, :windows
  @lines=[]
  @windows=[]
  lines = 0
  servicetimes = []

def initialize(lines, windows)
  
  numlines = lines
  numwindows = windows
  
  for i in 0..numlines
    @lines.pop(Line.new)
  end
  
  for i in 0..servicetimes.size
    @windows.pop(Window.new(servicetimes[i]))
  end
  
end


end
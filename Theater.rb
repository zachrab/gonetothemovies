class Theater
attr_accessor :lines, :windows
@lines=[]
@windows=[]
lines = 0
numwindows = 0

def initialize(lines, windows)
  numlines = lines
  numwindows = windows
  for i in 0..numlines
    @lines.pop(Line.new)
  end
  for i in 0..numwindows
    @windows.pop(Window.new)
  end
  
end


end
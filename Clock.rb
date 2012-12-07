class Clock
attr_accessor :time


def initialize
  @time = 0
end

def tick
  @time += 1
end

end

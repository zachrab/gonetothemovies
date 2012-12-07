class Window
  attr_accessor :service_time, :occupied, :ticektsold
  
  def initialize(service_time)
    @occupied = false
    @service_time = service_time
    @ticketsold = 0
  end
  
  def sellticket
    @occupied = true
    @ticketsold += 1
  end
  
  def soldticket
    @occupied = false
  end
  
end

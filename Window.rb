class Window
  attr_accessor :service_time, :occupied, :ticektsold
  
  def initialize(service_time)
  @occupied = false
  @service_time = service_time
  @ticketsold = 0
  end
  
  def sellTicket
    @occupied = true
    @ticketsold += 1
  end

end

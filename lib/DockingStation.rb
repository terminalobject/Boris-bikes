class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no more bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "The docking station is full" if @bikes.count >= 20
    @bikes << bike
    @bikes.last
  end

  def full?
    if @bikes.count >= 20
      true
    else 
      false
    end 
  end 

  def empty?
    if @bikes.count >= 20
      false
    else 
      true
    end 
  end 
end

class DockingStation
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "There are no more bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "The docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.count <= 0
  end
end

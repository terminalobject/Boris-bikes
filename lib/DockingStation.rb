class DockingStation
  attr_accessor :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "There are no more bikes available" if empty?
    fail "This bike is broken" if @bikes.last.working? == false
    @bikes.pop
  end

  def dock(bike)
    fail "The docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

  def report_broken_bike(bike)
    bike.break
    dock(bike)
  end

  private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.count <= 0
  end
end

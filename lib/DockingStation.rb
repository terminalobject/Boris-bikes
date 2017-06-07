class DockingStation
  attr_accessor :bike

  def initialize
    @bike = bike
  end

  def release_bike
    fail "There are no more bikes available" unless @bike
    @bike
  end

  def dock(bike)
    fail "The docking station is full" if @bike
    @bike = bike
  end

end

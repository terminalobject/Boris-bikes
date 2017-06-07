class DockingStation
  attr_reader :bike

  def initialize
    @bike = bike
  end

  def release_bike
    bike = Bike.new
  end

  def dock(bike)
    @bike = bike
  end

end

class Bike
  attr_reader :status

  def initialize(status="working")
    @status = status
  end

  def break
    @status = "broken"
  end

  def working?
    @status == "working"
  end
end

class Ship

  attr_reader :type, :length, :location, :hits

  def initialize(type, length, location="")
    @type = type
    @length = length
    @location = location
    @hits = length
  end

  def hit
    @hits -= 1
  end

  def sunk?
    @hits == 0
  end

end

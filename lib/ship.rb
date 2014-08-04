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

  def set_coordinates(board)
    board[coordinate_one(self.location)] = 'x'
    board[coordinate_two(self.location)] = 'x'
    board[coordinate_three(self.location)] = 'x'
  end

  def coordinate_one(coordinates)
    coordinates.split(" ")[0]
  end

  def coordinate_two(coordinates)
    coordinates.split(" ")[1]
  end

  def coordinate_three(coordinates)
    coordinates.split(" ")[2]
  end

end

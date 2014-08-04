
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
    #this is not working correctly
    if (valid_placement(coordinate_one(self.location), board))
      board[coordinate_one(self.location)] = self.type
    else
      return "invalid"
    end

    if (valid_placement(coordinate_two(self.location), board))
      board[coordinate_two(self.location)] = self.type
    else
      return "invalid"
    end

    if (valid_placement(coordinate_three(self.location), board))
      board[coordinate_three(self.location)] = self.type
    else
      return "invalid"
    end
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

  def valid_placement(coordinate, board)
    board[coordinate] == nil
  end

end

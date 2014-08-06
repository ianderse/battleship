module AiPlacement

  def randomize_ai_board
    #pick first position, check surrounding positions if there is something there or not. (ie. A2, then A1||A3||B2)
    #for next element "A1".succ
    #element below "A1".split('').rotate.join.succ.split('').rotate.join
    #previous element, hash.keys, index of first position -1. make sure is >= 0
    #element above hash.keys, index -4

    #need to set individual coordinates as they are chosen

    @ai_ship_one = Ship.new('x', 2)
    ship_a_first_position = @ai_board.keys.sample
    @ai_ship_one.set_individual_coordinate(@ai_board, ship_a_first_position)
    ship_a_next_position = get_next_position(ship_a_first_position)
    @ai_ship_one.set_individual_coordinate(@ai_board, ship_a_next_position)

    puts ship_a_coordinates = "#{ship_a_first_position} #{ship_a_next_position}"

    @ai_ship_one.location = ship_a_coordinates
    @ai_armada << @ai_ship_one

    @ai_ship_two = Ship.new('y', 3)

    #third ship can only start on A1, A2, B1, B2, C1, C2, D1, D2
    #need to check if first position is taken or not
    ship_b_first_position = find_third_start
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_first_position)
    ship_b_second_position = get_next_position(ship_b_first_position)
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_second_position)
    #when checking third position, has to be in the same row or column as the first two
    ship_b_third_position = get_next_position(ship_b_second_position)
    @ai_ship_two.set_individual_coordinate(@ai_board, ship_b_third_position)

    puts ship_b_coordinates = "#{ship_b_first_position} #{ship_b_second_position} #{ship_b_third_position}"

    @ai_ship_two.location = ship_b_coordinates
    @ai_armada << @ai_ship_two
  end

  def find_third_start
    third_ship_start = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2', 'D1', 'D2']
    location = third_ship_start.sample
    if @ai_board[location] != nil
      find_third_start
    else
      return location
    end
  end

  def get_next_position(first_position)

    if first_position.split('')[1].succ.to_i >= 5 || @ai_board[first_position.succ] != nil
      get_previous_position(first_position)
    else
      first_position.succ
    end
  end

  def get_position_below(first_position)
    #i know I could use key index value for this like the other ones, but this is hilarious
    if first_position.split('').rotate.join.succ.split('').rotate[0] >= 'E' || @ai_board[first_position.split('').rotate.join.succ.split('').rotate.join] != nil
      get_position_above(first_position)
    else
      first_position.split('').rotate.join.succ.split('').rotate.join
    end
  end

  def get_previous_position(first_position)
    previous_index = @ai_board.keys.index(first_position)-1
    if previous_index < 0 || @ai_board[@ai_board.keys[previous_index]] != nil
      get_position_below(first_position)
    else
      @ai_board.keys[previous_index]
    end
  end

  def get_position_above(first_position)
    #bug here with first position - 4, change to previous position logic
    previous_index = @ai_board.keys.index(first_position) -4
    if previous_index > 0
      @ai_board.keys[previous_index]
    end
  end

end

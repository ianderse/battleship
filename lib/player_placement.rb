module PlayerPlacement

  def place_two_unit_ship
    placement = placement_input
    if (placement.size < 5 || placement.size > 5) || (!@valid_choices.include?(placement[0..1]) || !@valid_choices.include?(placement[3..4])) || !check_adjacent(placement)
      @messager.invalid
      place_two_unit_ship
    end
    @pship_one = Ship.new('x', 2, placement)
    @p_armada << @pship_one
    @pship_one.set_coordinates(@new_game.player_board)
  end

  def place_three_unit_ship
    placement = placement_input
    if (placement.size < 8 || placement.size > 8) || (!@valid_choices.include?(placement[0..1]) || !@valid_choices.include?(placement[3..4]) || !@valid_choices.include?(placement[6..7])) || !check_adjacent(placement, 3)
      @messager.invalid
      place_three_unit_ship
    end
    @pship_two = Ship.new('y', 3, placement)
    @p_armada << @pship_two
    @pship_two.set_coordinates(@new_game.player_board)
  end

  def check_adjacent(coordinates,size=2)
    if size == 2
      if coordinates[0] != coordinates[3]
        check_adjacent_vertical(coordinates)
      elsif coordinates[1] != coordinates[4]
        check_adjacent_horizontal(coordinates)
      end
    elsif size == 3
      check_adjacent(coordinates[0..2], 2)
      check_adjacent(coordinates[3..7], 2)
    end
  end

  def check_adjacent_vertical(coordinates)
    #split coordinates, if coordinate1[0] == coordinate2[0].succ then
    #coordinates are adjacent, same with c1[1] == c2[1].succ
    c1 = coordinates[0..1]
    c2 = coordinates[3..4]

    if c1[0].succ != c2[0]
      false
    else
      true
    end
  end

  def check_adjacent_horizontal(coordinates)
    c1 = coordinates[0..1]
    c2 = coordinates[3..4]

    if c1[1].succ != c2[1]
      false
    else
      true
    end
  end
end

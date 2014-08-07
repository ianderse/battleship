module PlayerBehaviors
  def player_shoot(coordinate)
    @player_shot_counter += 1
    if @ai_board[coordinate] == 'x' || @ai_board[coordinate] == 'y'
      @ai_board[coordinate] = 'H'
      @displayed_ai_board[coordinate] = 'H'
      hit_sequence(coordinate)
    elsif @ai_board[coordinate] == nil
      @ai_board[coordinate] = 'O'
      @displayed_ai_board[coordinate] = 'O'
      @messager.miss
    elsif @ai_board[coordinate] == 'O' || @ai_board[coordinate] == 'H'
      @messager.repeat_shot
      return "invalid"
    end

  end

  def hit_ship(ship)
    ship.hit
  end


  def hit_sequence(coordinate)
    #for each ai ship see if it has a position that equals the coordinate that was hit,
    #if it does, hit the ship (ship.hit), see if it sunk.

    @ai_armada.each do |ship|
      if ship.location.split.include?(coordinate)
        @messager.hit
        hit_ship(ship)
        if ship.hits == 0
          @messager.sunk_ship(ship)
          @ai_armada.delete(ship)
          if @ai_armada.size == 0
            end_game_win
          end
        end
      end
    end
  end
end

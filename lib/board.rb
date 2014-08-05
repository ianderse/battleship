require_relative 'messager'
require_relative 'ship'

#do i need AI board and displayed ai board? is there a reson to keep both?

class Board

  attr_reader :ai_board, :player_board

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
    @output = output
    @win_condition = false
    @player_turn = true
    @ai_armada = []
  end

  def setup
    @ai_board = setup_board(4)
    randomize_ai_board
    @displayed_ai_board = setup_board(4)
    @player_board = setup_board(4)
  end

  def randomize_ai_board
    @ai_ship_one = Ship.new('x', 2, "A1 A2")
    @ai_ship_two = Ship.new('y', 3, "B1 B2 B3")
    @ai_ship_one.set_coordinates(@ai_board)
    @ai_ship_two.set_coordinates(@ai_board)

    @ai_armada << @ai_ship_one
    @ai_armada << @ai_ship_two
  end

  def setup_board(size)

    letters = Array ('A'..'Z')
    hash = {}
    size.times do |i|
      x = i+1
      y = letters[i]
      key = y+x.to_s
      hash.store(key, nil)
      size.times do |j|
        x = j+1
        key = y+x.to_s
        hash.store(key, nil)
      end
    end

    Hash[hash.sort.map {|key, value| [key, value]}]
  end

  def player_shoot(coordinate)

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

  def ai_shoot(armada)

  end

  def hit_sequence(coordinate)
    #for each ai ship see if it has a position that equals the coordinate that was hit,
    #if it does, hit the ship (ship.hit), see if it sunk.

    @ai_armada.each do |ship|
      if ship.location.split.include?(coordinate)
        @messager.hit
        ship.hit
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

  def end_game_win
    @messager.win
    win!
  end

  def print_player_map
    @messager.print_player_map(@displayed_ai_board)
  end

  def print_ai_map
    @messager.print_ai_map(@player_board)
  end

  def win?
    @win_condition
  end

  def win!
    @win_condition = true
  end

  def player_turn?
    @player_turn
  end

  def turn!
    @player_turn = !@player_turn
  end

end

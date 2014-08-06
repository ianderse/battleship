require_relative 'messager'
require_relative 'ship'
require_relative 'ai_behaviors'

#do i need AI board and displayed ai board? is there a reson to keep both?
# move out AI stuff into AiPlacement module

class Board
  include AiBehaviors

  attr_reader :ai_board, :player_board

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
    @output = output
    @win_condition = false
    @cpu_win_condition = false
    @player_turn = true
    @ai_armada = []
    @player_shot_counter = 0
    @ai_shot_counter = 0
  end

  def setup
    @ai_board = setup_board(4)
    randomize_ai_board
    @displayed_ai_board = setup_board(4)
    @player_board = setup_board(4)
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

  def end_game_win
    @messager.win(@player_shot_counter)
    win!
  end

  def end_game_lose
    @messager.lose(@ai_shot_counter)
    cpu_win!
  end

  def print_player_map
    @messager.print_player_map(@displayed_ai_board)
  end

  def print_ai_map
    @messager.print_ai_map(@player_board)
  end

  def someone_won?
    @win_condition || @cpu_win_condition
  end

  def win!
    @win_condition = true
  end

  def cpu_win!
    @cpu_win_condition = true
  end

  def player_turn?
    @player_turn
  end

  def turn!
    @player_turn = !@player_turn
  end

end

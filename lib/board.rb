require_relative 'messager'

class Board

  attr_accessor :ai_board, :player_board

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @win_condition = false
    @player_turn = true
  end

  def setup
    @messager.print_intro
    @ai_board = setup_board(4)
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

  def set_coordinates(coordinate)
    
  end

  def print_player_map
    @messager.print_player_map(@player_board)
  end

  def print_ai_map
    @messager.print_ai_map(@ai_board)
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

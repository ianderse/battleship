require_relative 'messager'
require_relative 'ship'
require_relative 'ai_behaviors'
require_relative 'player_behaviors'

#do i need AI board and displayed ai board? is there a reson to keep both?

class Board
  include AiBehaviors
  include PlayerBehaviors

  attr_reader :ai_board, :player_board
  attr_accessor :ai_board #for testing purposes

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
    @finish_time = Time.now
    @start_time = Time.now
  end

  def setup
    @ai_board = setup_board(4)
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

  def end_game_win
    @finish_time = Time.now
    @messager.win(@player_shot_counter, @start_time, @finish_time)
    win!
  end

  def end_game_lose
    @finish_time = Time.now
    @messager.lose(@ai_shot_counter, @start_time, @finish_time)
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

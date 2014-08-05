#learning goals:
#   distinguish the library from the binary
#   - the library needs to be usable from *any* binary
#     in *any* way, doesn't atually *do* anything
#   - the binary sits between the particular style of use
#     (e.g. ConsoleBinary), uses the tools that
#     the library provides to present it for that medium
#   - don't directly talk to puts/gets, pass them into instance of Battleship

require_relative 'board'
require_relative 'messager'

class Battleship

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
    @output = output
    @p_armada = []
  end

  def run_game#(choice) #for testing
    @messager.welcome
    choice ||= get_menu_option

    if choice == 'q'
      @output.puts "Thanks for playing."
      return 0
    elsif choice == 'i'
      @messager.print_instructions
      run_game
    elsif choice == 'p'
      play_game
      return 0
    end
  end

  def play_game
    @new_game = Board.new(@input, @output)
    @new_game.setup
    @messager.print_intro
    @messager.two_unit_ship
    # place_two_unit_ship
    if place_two_unit_ship == "invalid"
      @messager.invalid
      place_two_unit_ship
    end

    @messager.three_unit_ship
    #place_three_unit_ship
    if place_three_unit_ship == "invalid"
      @messager.invalid
      place_three_unit_ship
    end

    while !@new_game.win?
      if @new_game.player_turn?
        @new_game.print_player_map
        if player_shoot == "invalid"
          player_shoot
        end
        @new_game.turn!
      else
        puts "CPU turn"
        @new_game.turn!
      end
    end

  end

  def player_shoot
    @new_game.player_shoot(@input.gets.strip.upcase)
  end

  def place_two_unit_ship
    @pship_one = Ship.new('x', 2, @input.gets.strip.upcase)
    @p_armada << @pship_one
    @pship_one.set_coordinates(@new_game.player_board)
  end

  def place_three_unit_ship
    @pship_two = Ship.new('y', 3, @input.gets.strip.upcase)
    @p_armada << @pship_two
    @pship_two.set_coordinates(@new_game.player_board)
  end

  def get_menu_option
    @input.gets.strip.downcase[0]
  end


end

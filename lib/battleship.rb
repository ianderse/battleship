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

    @new_game.print_player_map
    @new_game.set_coordinates
    #while !@new_game.win?
    #end
  end

  def get_menu_option
    @input.gets.chomp.downcase[0]
  end


end

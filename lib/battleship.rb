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
    @output.puts welcome
    choice ||= get_menu_option

    if choice == 'q'
      @output.puts "Thanks for playing."
      return 0
    elsif choice == 'i'
      @messager.print_instructions
      run_game
    elsif choice == 'p'
      play_game
    end
  end

  def play_game
    @new_game = Board.new(@input, @output)
    @new_game.setup
  end

  def get_menu_option
    @messager.menu_input
  end

  def welcome
    "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end


end

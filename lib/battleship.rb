#personal learning goals: (Feedback from Josh on Mastermind)
#   distinguish the library from the binary
#   - the library needs to be usable from *any* binary
#     in *any* way, doesn't atually *do* anything
#   - the binary sits between the particular style of use
#     (e.g. ConsoleBinary), uses the tools that
#     the library provides to present it for that medium
#   - don't directly talk to puts/gets, pass them into instance of Battleship


#known issue: when improperly placing a ship, causes next input to be invalid too,
#next input then works

require_relative 'board'
require_relative 'messager'
require_relative 'player_placement'

class Battleship

  include PlayerPlacement

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
    @p_armada = []
    @valid_choices = @new_game.setup_board(4).keys
    @new_game.setup
    @messager.print_intro
    @messager.two_unit_ship
    # place_two_unit_ship

    place_two_unit_ship

    @messager.three_unit_ship
    #place_three_unit_ship

    place_three_unit_ship

    while !@new_game.someone_won?
      if @new_game.player_turn?
        @new_game.print_player_map
        if player_shoot == "invalid"
          player_shoot
        end
        @new_game.turn!
        sleep(1)
      else
        ai_shoot
        @new_game.print_ai_map
        @new_game.turn!
        sleep(1)
      end
    end
    play_again

  end

  def play_again
    @messager.play_again
    choice = get_menu_option
    if choice == 'p'
      play_game
    else
      return 0
    end
  end


  def player_shoot
    shot = placement_input
    if @valid_choices.include?(shot)
      @new_game.player_shoot(shot)
    else
      @messager.invalid_shot
      return "invalid"
    end
  end

  def ai_shoot
    @new_game.ai_shoot(@p_armada)
  end

  def get_menu_option
    @input.gets.strip.downcase[0]
  end

  def placement_input
    @input.gets.strip.upcase
  end

end

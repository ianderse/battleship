#learning goals: (Feedback from Josh on Mastermind)
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
    @valid_choices = @new_game.setup_board(4).keys
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

  end

  def player_shoot
    @new_game.player_shoot(@input.gets.strip.upcase)
  end

  def ai_shoot
    @new_game.ai_shoot(@p_armada)
  end

  def place_two_unit_ship
    #needs to validate that they are in a line
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
    #needs to validate they they are in a line
    placement = placement_input
    if (placement.size < 8 || placement.size > 8) || (!@valid_choices.include?(placement[0..1]) || !@valid_choices.include?(placement[3..4]) || !@valid_choices.include?(placement[6..7])) || !check_adjacent(placement)
      @messager.invalid
      place_three_unit_ship
    end
    @pship_two = Ship.new('y', 3, placement)
    @p_armada << @pship_two
    @pship_two.set_coordinates(@new_game.player_board)
  end

  def placement_input
    @input.gets.strip.upcase
  end

  def get_menu_option
    @input.gets.strip.downcase[0]
  end

  def check_adjacent(coordinates)
    if coordinates[0] != coordinates[3]
      check_adjacent_vertical(coordinates)
    elsif coordinates[1] != coordinates[4]
      check_adjacent_horizontal(coordinates)
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

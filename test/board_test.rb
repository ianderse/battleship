
class BoardTest < Minitest::Test

  def setup
    $SiB.record_result(9, (@board = Board.new($stdin, $stdout)))
    $SiB.record_result(10, (@board.setup))
  end

  def test_it_can_setup_the_board_with_4x4_grid
    $SiB.record_result(14, (skip))
    # assert_equal {"A1"=>nil, "A2"=>nil, "A3"=>nil, "A4"=>nil,
    #               "B1"=>nil, "B2"=>nil, "B3"=>nil, "B4"=>nil,
    #               "C1"=>nil, "C2"=>nil, "C3"=>nil, "C4"=>nil,
    #               "D1"=>nil, "D2"=>nil, "D3"=>nil, "D4"=>nil}, @board.setup_board(4)
  end


  # def test_it_can_print_ai_map
  #
  # end
  #
  # def test_it_can_print_player_map
  #   skip
  #   player_map = @board.setup_board(4)
  #   @board.print_player_map
  #
  #   assert_equal "Your turn! Here's what you know:\n===========\n. 1 2 3 4\nA\nB\nC\nD\n===========\nEnter a coordinate to shoot at:", @output
  #
  # end
  #
  # def test_player_can_shoot
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #
  #   assert_equal "Hit!", @board.player_shoot("A1")
  #
  # end
  #
  # def test_player_can_miss
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #
  #   assert_equal 'Miss!', @board.player_shoot("A3")
  # end
  #
  # def test_player_cannot_shoot_same_spot_twice
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #   @board.player_shoot("A2")
  #   assert_equal "invalid", @board.player_shoot("A2")
  # end
  #
  # def test_win_condition_starts_false
  #   skip
  #   assert_equal false, @board.win?
  # end
  #
  # def test_it_can_set_win_condition_to_true
  #   skip
  #   @board.win!
  #   assert_equal true, @board.win?
  # end
  #
  # def test_it_is_players_turn_by_default
  #   assert_equal true, @board.player_turn?
  # end
  #
  # def test_it_can_set_ai_turn
  #   @board.turn!
  #   assert_equal false, @board.player_turn?
  # end
  #
  # def test_it_can_swap_turns
  #   @board.turn!
  #   @board.turn!
  #   assert_equal true, @board.player_turn?
  # end
  #
  # def test_it_knows_a_ship_is_overlapping
  #
  # end
  #
  # def test_it_knows_coordinates_have_to_be_adjacent
  #
  # end

  def test_it_gets_previous_position
    $SiB.record_result(95, (assert_equal false, @board.get_previous_position('A1')))
  end

  def test_it_gets_successive_position
    $SiB.record_result(99, (skip))
    $SiB.record_result(100, (@board.ai_board['A3'] = 'x'))
    $SiB.record_result(101, (assert_equal false, @board.get_next_position('A2')))
  end

  def test_it_gets_position_below
    $SiB.record_result(105, (skip))
    $SiB.record_result(106, (assert_equal false, @board.get_position_below('D4')));rescue Exception;line_number = $!.backtrace.grep(/#{__FILE__}/).first[/:\d+/][1..-1].to_i;$SiB.record_exception line_number, $!;$SiB.exitstatus = 1;$SiB.exitstatus = $!.status if $!.kind_of? SystemExit;end
  end

  def test_it_gets_position_above

  end

end
gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/board'
require_relative '../lib/ship'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new($stdin, $stdout)
    @board.setup
  end

  def test_it_can_setup_the_board_with_4x4_grid
    skip
    # assert_equal {"A1"=>nil, "A2"=>nil, "A3"=>nil, "A4"=>nil,
    #               "B1"=>nil, "B2"=>nil, "B3"=>nil, "B4"=>nil,
    #               "C1"=>nil, "C2"=>nil, "C3"=>nil, "C4"=>nil,
    #               "D1"=>nil, "D2"=>nil, "D3"=>nil, "D4"=>nil}, @board.setup_board(4)
  end


  # def test_it_can_print_ai_map
  #
  # end
  #
  # def test_it_can_print_player_map
  #   skip
  #   player_map = @board.setup_board(4)
  #   @board.print_player_map
  #
  #   assert_equal "Your turn! Here's what you know:\n===========\n. 1 2 3 4\nA\nB\nC\nD\n===========\nEnter a coordinate to shoot at:", @output
  #
  # end
  #
  # def test_player_can_shoot
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #
  #   assert_equal "Hit!", @board.player_shoot("A1")
  #
  # end
  #
  # def test_player_can_miss
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #
  #   assert_equal 'Miss!', @board.player_shoot("A3")
  # end
  #
  # def test_player_cannot_shoot_same_spot_twice
  #   skip
  #   @ship = Ship.new('x', 2, "A1 A2")
  #   @ship.set_coordinates(@board.ai_board)
  #   @board.player_shoot("A2")
  #   assert_equal "invalid", @board.player_shoot("A2")
  # end
  #
  # def test_win_condition_starts_false
  #   skip
  #   assert_equal false, @board.win?
  # end
  #
  # def test_it_can_set_win_condition_to_true
  #   skip
  #   @board.win!
  #   assert_equal true, @board.win?
  # end
  #
  # def test_it_is_players_turn_by_default
  #   assert_equal true, @board.player_turn?
  # end
  #
  # def test_it_can_set_ai_turn
  #   @board.turn!
  #   assert_equal false, @board.player_turn?
  # end
  #
  # def test_it_can_swap_turns
  #   @board.turn!
  #   @board.turn!
  #   assert_equal true, @board.player_turn?
  # end
  #
  # def test_it_knows_a_ship_is_overlapping
  #
  # end
  #
  # def test_it_knows_coordinates_have_to_be_adjacent
  #
  # end

  def test_it_gets_previous_position
    assert_equal false, @board.get_previous_position('A1')
  end

  def test_it_gets_successive_position
    skip
    @board.ai_board['A3'] = 'x'
    assert_equal false, @board.get_next_position('A2')
  end

  def test_it_gets_position_below
    skip
    assert_equal false, @board.get_position_below('D4')
  end

  def test_it_gets_position_above

  end

end

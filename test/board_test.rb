gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new($stdin, $stdout)
  end

  def test_it_can_setup_the_board_with_4x4_grid
    skip
    # assert_equal {"A1"=>nil, "A2"=>nil, "A3"=>nil, "A4"=>nil,
    #               "B1"=>nil, "B2"=>nil, "B3"=>nil, "B4"=>nil,
    #               "C1"=>nil, "C2"=>nil, "C3"=>nil, "C4"=>nil,
    #               "D1"=>nil, "D2"=>nil, "D3"=>nil, "D4"=>nil}, @board.setup_board(4)
  end


  def test_it_can_print_ai_map

  end

  def test_it_can_print_player_map
    skip
    player_map = @board.setup_board(4)
    @board.print_player_map

    assert_equal "Your turn! Here's what you know:\n===========\n. 1 2 3 4\nA\nB\nC\nD\n===========\nEnter a coordinate to shoot at:", @output

  end

  def test_win_condition_starts_false
    assert_equal false, @board.win?
  end

  def test_it_can_set_win_condition_to_true
    @board.win!
    assert_equal true, @board.win?
  end

  def test_it_is_players_turn_by_default
    assert_equal true, @board.player_turn?
  end

  def test_it_can_set_ai_turn
    @board.turn!
    assert_equal false, @board.player_turn?
  end

  def test_it_can_swap_turns
    @board.turn!
    @board.turn!
    assert_equal true, @board.player_turn?
  end

  def test_it_can_get_first_coordinate
    assert_equal "A1", @board.coordinate_one("A1 A2")
  end

  def test_it_can_get_second_coordinate
    assert_equal "A2", @board.coordinate_two("A1 A2")
  end

  def test_it_can_set_ship_coordinates
    #@ship = Ship.new('destroyer')
    #@board.set_ship_coordinates("A1 A2", @ship)
    @board.setup

    @board.set_ship_coordinates("A1 A2")

    assert_equal 'x', @board.player_board["A1"]
    assert_equal 'x', @board.player_board["A2"]

  end

  def test_it_knows_a_ship_is_overlapping

  end

  def test_it_knows_coordinates_have_to_be_adjacent

  end

end

gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/messager'

class MessagerTest < Minitest::Test

  def setup
    @messager = Messager.new($stdin, $stdout)
  end

  def test_it_can_print_intro
    assert_equal"I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\nEnter the squares for the two-unit ship:", @messager.print_intro
  end

  def test_it_can_print_instructions
    assert_equal "instructions", @messager.print_instructions
  end

  def test_it_prints_welcome_message
    assert_equal "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", @messager.welcome
  end

  def test_it_can_print_player_map
    skip
    player_map = @board.setup_board(4)
    @board.print_player_map

    assert_equal "Your turn! Here's what you know:\n===========\n. 1 2 3 4\nA\nB\nC\nD\n===========\nEnter a coordinate to shoot at:", @output

  end
end

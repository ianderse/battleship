gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new($stdin, $stdout)
  end

  def test_it_can_setup_the_board

  end

  def test_it_can_print_intro
    assert_equal"I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\nEnter the squares for the two-unit ship:", @board.print_intro
  end
end

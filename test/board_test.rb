gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new($stdin, $stdout)
  end

  def test_it_can_setup_the_board
    skip
    assert_equal (somearray?hash?), @board.setup
  end


  def test_it_can_print_ai_map

  end

  def test_it_can_print_player_map

  end

end

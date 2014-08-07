gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/board'
require_relative '../lib/ai_behaviors'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new($stdin, $stdout)
    @board.setup
  end

  def test_it_skips_invalid_previous_position
    assert_equal 'B1', @board.get_previous_position('A1')
  end

  def test_it_skips_invalid_successive_position
    @board.ai_board['A3'] = 'x'
    assert_equal 'A1', @board.get_next_position('A2')
  end

  def test_it_skips_invalid_position_below
    assert_equal 'C4', @board.get_position_below('D4')
  end

  def test_it_skips_invalid_position_above
    assert_equal nil, @board.get_position_above('A4')
  end

end

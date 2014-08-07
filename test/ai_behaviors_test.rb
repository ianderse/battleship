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
    skip
    assert_equal false, @board.get_previous_position('A1')
  end

  def test_it_skips_invalid_successive_position
    skip
    @board.ai_board['A3'] = 'x'
    assert_equal false, @board.get_next_position('A2')
  end

  def test_it_skips_invalid_position_below
    skip
    assert_equal false, @board.get_position_below('D4')
  end

  def test_it_skips_invalid_position_above
    assert_equal false, @board.get_position_above('A4')
  end

end
